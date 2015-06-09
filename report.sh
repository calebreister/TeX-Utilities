#!/bin/sh

# $1 - folder name to use

mkdir -p $1
cd $1

mkdir -p data/sim img tex

cd ./tex
cp -n ~/Templates/LaTeX/* ./
mv ./Report.tex ./$1.tex
sed -i "1iNAME := $1" makefile #prepend NAME variable to makefile
