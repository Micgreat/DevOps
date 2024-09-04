#!/bin/bash

# IAM Onboarding Script
# This script onboards 5 employees by creating IAM users, an admin group,
# and assigns administrative privileges to the users.

# Ensure the AWS CLI is installed
if ! command -v aws &> /dev/null
then
    echo "AWS CLI could not be found. Please install it first."
    exit 1
fi

# Array of IAM user names (representing 5 employees)
users=("employee1" "employee2" "employee3" "employee4" "employee5")

# Function to create an IAM group named 'admin'
create_admin_group() {
    echo "Creating IAM group 'admin'..."
    aws iam create-group --group-name admin
    echo "IAM group 'admin' created."

    # Attach the AWS managed policy for admin privileges to the 'admin' group
    echo "Attaching the 'AdministratorAccess' policy to the 'admin' group..."
    aws iam attach-group-policy --group-name admin --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
    echo "'AdministratorAccess' policy attached to the 'admin' group."
}

# Function to create IAM users and add them to the 'admin' group
onboard_users() {
    for user in "${users[@]}"; do
        # Create IAM user
        echo "Creating IAM user '$user'..."
        aws iam create-user --user-name "$user"
        echo "IAM user '$user' created."

        # Add IAM user to the 'admin' group
        echo "Adding IAM user '$user' to the 'admin' group..."
        aws iam add-user-to-group --user-name "$user" --group-name admin
        echo "IAM user '$user' added to the 'admin' group."
    done
}

# Create the admin group and attach the administrative policy
create_admin_group

# Onboard the users and assign them to the admin group
onboard_users

echo "All users have been onboarded and assigned to the 'admin' group with administrative privileges."


