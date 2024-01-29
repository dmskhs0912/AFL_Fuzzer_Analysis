#!/bin/bash

for file in ./output/default/crashes/*;
do
	./exif_fuzz $file
done
