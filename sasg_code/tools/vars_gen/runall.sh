#!/bin/bash

FILES=./input/*
OUTPUT=./output
for file in $FILES;
do
     python vars.py "$file" vars.template "$OUTPUT"
done
