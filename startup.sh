#!/bin/bash
sudo apt-get update
sudo apt-get install lsb g++ expect
sudo apt-get install gcc gfortran expect
git clone  https://github.com/DavidCamposeco/gHANK.git
sudo chmod -700 gHANK/Fortran/*
cd gHANK/Fortran
