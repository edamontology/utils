#!/bin/bash

# Check if input file and replacement TSV are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <replacement_tsv>"
    exit 1
fi

input_file="$1"
replacement_tsv="$2"

# Temporary file to store the processed output
output_file=$(mktemp)

# Copy the input file to a temporary file
cp "$input_file" "$output_file"

# prefixes for replacement of topics and resources
PREFIX_ABOUT='rdf\:about\="http:\/\/edamontology\.org\/'
PREFIX_RESOURCE='rdf\:resource\="http:\/\/edamontology\.org\/'

# Read the TSV file line by line
while IFS=$'\t' read -r regex replacement; do
    # Skip empty lines or comments
    [[ -z "$regex" || "$regex" =~ ^# ]] && continue
    # echo "regex: $regex"
    # echo "replacement: $replacement"
    
    # Use sed to perform the replacement
    sed -i -e "s/$PREFIX_ABOUT$regex/$PREFIX_ABOUT$replacement/g" "$output_file"
    sed -i -e "s/$PREFIX_RESOURCE$regex/$PREFIX_RESOURCE$replacement/g" "$output_file"
done < "$replacement_tsv"

# Output the modified file
cat "$output_file"

# Clean up temporary file
rm "$output_file"
