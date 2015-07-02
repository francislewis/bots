#!/bin/bash

mkdir ./streaking
cd ./streaking
echo "$RANDOM" > ./random
git add . -A
sleep 10s
git commit -m "Streaked"
sleep 10s
rm -rf ./streaking
sleep 10s
git add . -A 
sleep 10s
git commit -m "Fizz Buzz"
sleep 10s
git push orign master
