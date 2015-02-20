#!/bin/sh

# $1 - folder name to use

mkdir $1
cd $1

mkdir data img

cp -n ~/Templates/LaTeX/* ./
mv ./Report.tex ./$1.tex
