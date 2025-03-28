#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_directory>"
    exit 1
fi

# Assign arguments to variables
input_directory=$1
# split=$2
# output_file=$3

label-studio-converter import yolo -i $input_directory/train -o train.json --image-root-url "/data/local-files/?d=$input_directory/train/images"

label-studio-converter import yolo -i $input_directory/train -o valid.json --image-root-url "/data/local-files/?d=$input_directory/valid/images"

label-studio-converter import yolo -i $input_directory/train -o test.json --image-root-url "/data/local-files/?d=$input_directory/test/images"