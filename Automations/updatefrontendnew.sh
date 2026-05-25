#!/bin/bash

# Use localhost (or your LAN IP if needed)
LOCAL_IP="localhost"

# Path to the frontend .env file
file_to_find="../frontend/.env.docker"

# Desired VITE_API_PATH
new_url="VITE_API_PATH=\"http://${LOCAL_IP}:31100\""

# Check the current VITE_API_PATH in the .env file
current_url=$(grep "VITE_API_PATH" $file_to_find)

# Update the .env file if the URL has changed
if [[ "$current_url" != "$new_url" ]]; then
    if [ -f $file_to_find ]; then
        sed -i -e "s|VITE_API_PATH.*|$new_url|g" $file_to_find
        echo "Updated VITE_API_PATH to $new_url"
    else
        echo "ERROR: File not found at $file_to_find"
    fi
else
    echo "VITE_API_PATH is already up-to-date"
fi

