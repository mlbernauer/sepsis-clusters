#!/bin/bash

# Michael L. Bernauer
#
# This file converts an xlsx sheet to csv and formats
# the column names something sane
#
# Usage: ./create_csv.sh <input_xlsx> <output_file>

outfile=$(echo $1 | sed 's/^\(.*\)\..*/\1/g').csv
libreoffice --convert-to csv $1
head -1 $outfile | sed 's/[^a-zA-Z0-9,]/_/g' | tr [:upper:] [:lower:] > $2
csvcut -K 1 $outfile >> $2
rm $outfile
