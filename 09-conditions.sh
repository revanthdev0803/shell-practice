#!/bin/bash

number=$1

if [$number -lt 10]
then
    echo "given number is less than ten"
else
    echo "not less than ten"
fi