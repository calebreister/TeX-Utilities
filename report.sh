#!/bin/sh

# $1 - folder name to use

mkdir -p $1
cd $1

mkdir -p data/sim img

cp -n ~/Templates/LaTeX/* ./
mv ./Report.tex ./$1.tex
