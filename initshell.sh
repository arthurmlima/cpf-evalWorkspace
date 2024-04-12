#!/bin/bash

# Ensure the mod folder exists
if [ ! -d "mod" ]; then
    mkdir mod
    echo "Created 'mod' folder."
else
    echo "'mod' folder already exists."
fi

# Compile for float precision
gcc -DUSE_FLOAT almain.c -lm -o main_float
echo "Compiled for float precision."

# Execute the float precision binary
./main_float
echo "Executed with float precision."

# Remove the float precision executable
rm main_float
echo "Removed float precision executable."

# Compile for double precision
gcc almain.c -lm -o main_double
echo "Compiled for double precision."

# Execute the double precision binary
./main_double
echo "Executed with double precision."

# Remove the double precision executable
rm main_double
echo "Removed double precision executable."
