#!/usr/bin/python
# -*- coding: utf8 -*-
import os

# Grab all files inside subdirectories within the current directory 
search_files ="find . -name *.CR2"

# Loop through all found files
for source_file in os.popen (search_files):
  # Remove \n at end of found files
  source_file = source_file[:-1]
  
  print "Processing file " + source_file
  
  os.popen ("ufraw-batch --wb=camera --exposure=auto --out-type=jpeg --compression=96 --out-path=./processed_images " + source_file )


