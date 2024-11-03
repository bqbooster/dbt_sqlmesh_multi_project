#!/bin/bash

# File containing the environment variables
ENV_FILE=".env"

# Check if the file exists
if [[ ! -f "$ENV_FILE" ]]; then
  echo "File $ENV_FILE does not exist."
  exit 1
fi

# Export each variable in the file
while IFS= read -r line; do
  # Skip empty lines and comments
  [[ -z "$line" || "$line" =~ ^# ]] && continue
  export "$line"
done < "$ENV_FILE"

echo "Environment variables exported from $ENV_FILE"