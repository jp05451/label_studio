#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input_directory> <split> <output_file>"
    exit 1
fi

# Assign arguments to variables
input_directory=$1
split=$2
output_file=$3

label-studio-converter import yolo -i $input_directory/$split -o $output_file --image-root-url "/data/local-files/?d=$input_directory/$split/images"