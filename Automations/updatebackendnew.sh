#!/bin/bash

# Use localhost (or your local IP if you want)
LOCAL_IP="localhost"

# Path to the .env file
file_to_find="../backend/.env.docker"

# Desired FRONTEND_URL
new_url="FRONTEND_URL=\"http://${LOCAL_IP}:5173\""

# Check the current FRONTEND_URL in the .env file (line 4)
current_url=$(sed -n "4p" $file_to_find)

# Update the .env file if the URL has changed
if [[ "$current_url" != "$new_url" ]]; then
    if [ -f $file_to_find ]; then
        sed -i -e "s|FRONTEND_URL.*|$new_url|g" $file_to_find
        echo "Updated FRONTEND_URL to $new_url"
    else
        echo "ERROR: File not found at $file_to_find"
    fi
else
    echo "FRONTEND_URL is already up-to-date"
fi

                                            
