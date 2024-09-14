#!/bin/bash

# Function to display the multiplication table in ascending order
display_table_ascending() {
    local num=$1     # The number for which the table is being generated
    local start=$2   # Start of the range (or 1 for full table)
    local end=$3     # End of the range (or 10 for full table)

    for ((i=start; i<=end; i++)); do
        echo "$num x $i = $((num * i))"
    done
}

# Function to display the multiplication table in descending order
display_table_descending() {
    local num=$1     # The number for which the table is being generated
    local start=$2   # Start of the range (or 1 for full table)
    local end=$3     # End of the range (or 10 for full table)

    for ((i=end; i>=start; i--)); do
        echo "$num x $i = $((num * i))"
    done
}

# Function to validate the input is a number
is_number() {
    local input=$1   # The input to validate
    if [[ $input =~ ^[0-9]+$ ]]; then
        return 0  # Input is a valid number
    else
        return 1  # Input is not a valid number
    fi
}

# Prompt the user to enter a number
echo -n "Enter a number for the multiplication table: "
read number

# Validate the number input
if ! is_number "$number"; then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Ask the user whether they want a full or partial table
echo -n "Do you want the full multiplication table (1-10) or a partial table within a range? (full/partial): "
read choice

# Initialize variables for start and end range
start=1
end=10

# Handle the user's choice between full and partial
if [[ "$choice" == "partial" ]]; then
    # Prompt for start and end of the range
    echo -n "Enter the start of the range: "
    read start
    echo -n "Enter the end of the range: "
    read end

    # Validate start and end range
    if ! is_number "$start" || ! is_number "$end"; then
        echo "Invalid range input. Please enter positive integers."
        exit 1
    fi

    if (( start > end )); then
        echo "Invalid range. The start must be less than or equal to the end."
        exit 1
    fi
elif [[ "$choice" != "full" ]]; then
    # Handle invalid choice for full/partial
    echo "Invalid choice. Please type 'full' or 'partial'."
    exit 1
fi

# Ask the user for the order of the table (ascending or descending)
echo -n "Do you want the table in ascending or descending order? (ascending/descending): "
read order

# Display the multiplication table based on the chosen order
if [[ "$order" == "ascending" ]]; then
    display_table_ascending "$number" "$start" "$end"
elif [[ "$order" == "descending" ]]; then
    display_table_descending "$number" "$start" "$end"
else
    echo "Invalid order choice. Please type 'ascending' or 'descending'."
    exit 1
fi
