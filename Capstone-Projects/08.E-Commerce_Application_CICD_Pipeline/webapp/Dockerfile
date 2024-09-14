# Dockerfile for React frontend

# Use the official Node.js image to build the frontend.
FROM node:18 AS build

# Set the working directory in the container.
WORKDIR /usr/src/app

# Copy package.json and package-lock.json.
COPY package*.json ./

# Install dependencies.
RUN npm install

# Copy the rest of the application code.
COPY . .

# Build the React application.
RUN npm run build

# Use a smaller image to serve the built app.
FROM nginx:alpine

# Copy the build files from the previous stage.
COPY --from=build /usr/src/app/build /usr/share/nginx/html

# Expose the port nginx is listening on.
EXPOSE 80

# Command to run nginx.
CMD ["nginx", "-g", "daemon off;"]