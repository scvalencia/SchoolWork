#!/bin/bash

wget https://dl.dropboxusercontent.com/u/64694855/01_notas.tsv
# awk '$3 == "INGMEC" && (($4 + $5 + $6) / 3) > 3 {printf("%s %s %.2f\n", $1, $2, (($4 + $5 + $6) / 3))}' 01_notas.tsv > mecanicos.txt
awk '$3 == "INGMEC" && (($4 + $5 + $6) / 3) > 3 {print $1, $2, (($4 + $5 + $6) / 3)}' 01_notas.tsv > mecanicos.txt
awk '$1 != "#Nombres" {print $1, $2, $3, ($4 + $5 + $6) / 3}' 01_notas.tsv | sort -k 4 > sorted.txt