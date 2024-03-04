#!/bin/bash


echo "$(date) - Waiting for mysql to deploy..."
sleep 10

echo "DB ready !"

node index.js