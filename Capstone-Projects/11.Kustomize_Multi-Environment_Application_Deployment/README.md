# Capstone Project #11: Implementing a Multi-Environment Application Deployment with Kustomize

## Project Scenario 
I am tasked with deploying a web application in a kubernetes environment. The application will have different configurations for development, staging and production environments. My goal is to utilize Kustomize to manage these configurations efficiently and integrate the process into a CI/CD pipeline. 


### Step 1:
1. Set up the directory `kustomize-capstone`, base directories `base/` and `overlays` and subdirectories `dev`, `staging` and `prod`.

2. In the `base/` directory, defne kubernetes resources like `deployment.yaml` and `service.yaml`. Create a `kustomization.yaml` file to include these resources. 

`base/deployment.yaml`
```markdown
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-web-app
  labels:
    app: my-web-app
spec:
  replicas: 1  # Default replica count
  selector:
    matchLabels:
      app: my-web-app
  template:
    metadata:
      labels:
        app: my-web-app
    spec:
      containers:
      - name: my-web-app
        image: my-web-app:latest  # Replace with your image
        ports:
        - containerPort: 80
```
`base/service.yaml`
```markdown
apiVersion: v1
kind: Service
metadata:
  name: my-web-app-service
  labels:
    app: my-web-app
spec:
  selector:
    app: my-web-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: ClusterIP  # Can be changed to NodePort or LoadBalancer for external access
```

`base/kustomization.yaml`
```markdown
resources:
  - deployment.yaml
  - service.yaml

```
3. In each subdirectory of `overlays/`, create a `kustomization.yaml` that customizes the base configuration for that environment and `patch.yaml`.

#### Dev
`overlays/dev/patch.yaml`
```markdown
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-web-app
spec:
  replicas: 2  # More replicas for dev testing
  template:
    spec:
      containers:
      - name: my-web-app
        resources:
          limits:
            memory: "512Mi"
            cpu: "0.5"
          requests:
            memory: "256Mi"
            cpu: "0.2"
```

`overlays/dev/kustomization.yaml`
```markdown
resources:
  - ../../base

patchesStrategicMerge:
  - patch.yaml
```

#### Staging
`overlays/staging/patch.yaml`
```markdown
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-web-app
spec:
  replicas: 3  # Staging could have more replicas
  template:
    spec:
      containers:
      - name: my-web-app
        resources:
          limits:
            memory: "1Gi"
            cpu: "1"
          requests:
            memory: "512Mi"
            cpu: "0.5"
```

`overlays/staging/kustomization.yaml`
```markdown
resources:
  - ../../base

patchesStrategicMerge:
  - patch.yaml
```

#### Prod
`overlays/prod/patch.yaml`
```markdown
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-web-app
spec:
  replicas: 5  # More replicas for production
  template:
    spec:
      containers:
      - name: my-web-app
        resources:
          limits:
            memory: "2Gi"
            cpu: "2"
          requests:
            memory: "1Gi"
            cpu: "1"
```

`overlays/prod/kustomization.yaml`
```markdown
resources:
  - ../../base

patchesStrategicMerge:
  - patch.yaml
```


### Step 2: Deploy to Github Action CI/CD Pipeline

1. Create a `deploy.yml file` in the `.github/workflows/` folder and paste the code.

```markdown
name: Deploy to Kubernetes

on:
  push:
    paths:
      - '**/*.yaml'   # Trigger on changes to all YAML files

      branches:
        - main        # Limit this to the 'main' branch
  pull_request:
    branches:
      - main         # Trigger workflow for PRs to the main branch

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Set up Kustomize
      run: |
        sudo apt-get update
        sudo apt-get install -y kustomize

    - name: Set up kubectl
      uses: azure/setup-kubectl@v3
      with:
        version: 'v1.25.0'

    - name: Authenticate with Kubernetes
      run: |
        echo "${{ secrets.KUBECONFIG_FILE }}" > $HOME/.kube/config

    - name: Deploy to Development Environment
      if: github.ref == 'refs/heads/main' && github.event_name == 'push'
      run: |
        kubectl apply -k overlays/dev

    - name: Deploy to Staging Environment
      if: github.ref == 'refs/heads/staging' && github.event_name == 'push'
      run: |
        kubectl apply -k overlays/staging

    - name: Deploy to Production Environment
      if: github.ref == 'refs/heads/production' && github.event_name == 'push'
      run: |
        kubectl apply -k overlays/prod
```

### Step 3: Manage Secrets and ConfigMaps

1. Use kustomize to generate configmaps and secrets and edit the existing codes.
add config-map.yaml

`base/config-file.yaml`

```markdown
# config-map.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: webapp-config
data:
  APP_ENV: "development"    # Set this value based on the environment
  LOG_LEVEL: "debug"
  MAX_CONN: "100"

```

`base/secret.yaml`

```markdown
# secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: webapp-secrets
type: Opaque
data:
  DB_PASSWORD: c2VjcmV0cGFzc3dvcmQ=     # Base64-encoded secret (e.g., 'secretpassword')
  API_KEY: c2VjcmV0YXBpa2V5              # Base64-encoded API key
```


`base/kustomization.yaml`
add below to the exisiting code

```markdown
# kustomize/base/kustomization.yaml
resources:
  - config-map.yaml       # Add your ConfigMap file
  - secret.yaml           # Add your Secret file
```

2. Customize the specific values in the respective environments 

`overlays/dev/kustomization.yaml`

```markdown
# overlays/dev/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - ../../base

# Patching ConfigMap for dev environment
configMapGenerator:
  - name: webapp-config
    behavior: merge
    literals:
      - APP_ENV=development
      - LOG_LEVEL=debug

# Patching Secret for dev environment
secretGenerator:
  - name: webapp-secrets
    behavior: merge
    literals:
      - DB_PASSWORD=ZGV2cGFzc3dvcmQ=        # 'devpassword'
      - API_KEY=ZGV2YXBpa2tleQ==            # 'devapikey'
```


`overlays/staging/kustomization.yaml`

```markdown
# overlays/staging/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - ../../base

# Patching ConfigMap for staging environment
configMapGenerator:
  - name: webapp-config
    behavior: merge
    literals:
      - APP_ENV=staging
      - LOG_LEVEL=info

# Patching Secret for staging environment
secretGenerator:
  - name: webapp-secrets
    behavior: merge
    literals:
      - DB_PASSWORD=c3RhZ2luZ3Bhc3N3b3Jk   # 'stagingpassword'
      - API_KEY=c3RhZ2luZ2FwaWtleQ==       # 'stagingapikey'
```

`overlays/prod/kustomization.yaml`

```markdown
# overlays/prod/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - ../../base

# Patching ConfigMap for production environment
configMapGenerator:
  - name: webapp-config
    behavior: merge
    literals:
      - APP_ENV=production
      - LOG_LEVEL=error

# Patching Secret for production environment
secretGenerator:
  - name: webapp-secrets
    behavior: merge
    literals:
      - DB_PASSWORD=cHJvZHBhc3N3b3Jk     # 'prodpassword'
      - API_KEY=cHJvZGFwaWtleQ==         # 'prodapikey'

```

### Step 4: Advanced Features like Transformers and Generators

1. Common labels and annotation using transformers, edit the `base/kustomization.yaml` file accordingly and append the code below

```markdown
# base/kustomization.yaml

commonLabels:
  app: my-webapp          # Add a common label to all resources
  environment: base

commonAnnotations:
  team: devops            # Add a common annotation to all resources
  version: v1.0
```

2. Dynamic data using generators 

```markdown
# base/kustomization.yaml

configMapGenerator:
  - name: webapp-config
    literals:
      - APP_ENV=base            # You can change this per environment in overlays
      - LOG_LEVEL=info

secretGenerator:
  - name: webapp-secret
    literals:
      - DB_PASSWORD=YWRtaW5wYXNz  # Base64 encoded password
      - API_KEY=YXBpa2V5YmFzZQ==  # Base64 encoded API key
    type: Opaque                 # Optional: defines the type of Secret
```
