#!/bin/bash

while getopts f:o: flag
do
    case "${flag}" in
        f) file=${OPTARG};;
        o) output=${OPTARG};;
    esac
done
echo "Compiling MIPS Assembly into Program File: $file";

if [ -z "$*" ]; then echo "Provide a MIPS assembly program using -f file.asm..."; exit -1; fi
PROG_DIR=./mips_assembler
PROGRAM=$1
python ${PROG_DIR}/assembler.py $file
