#!/bin/bash

PRODUCT_CODE="IC"
BUILD_NUMBER="203.7148.57"

while read -r line; do
  eval "$(printf "curl -JLO \"https://plugins.jetbrains.com/pluginManager?action=download&id=%s&build=%s-%s\"\n" "$line" "$PRODUCT_CODE" "$BUILD_NUMBER")"
done < list.txt