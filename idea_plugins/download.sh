#!/bin/bash

PRODUCT_CODE="IC"
BUILD_NUMBER="203.7148.57"

while read -r line; do
  eval "$(printf "curl -sJLO \"https://plugins.jetbrains.com/pluginManager?action=download&id=%s&build=%s-%s\"\n" "$line" "$PRODUCT_CODE" "$BUILD_NUMBER")"
done < list.txt

IDEA_SPRING_TOOLS_URL=$(curl -s "https://api.github.com/repos/wdslb/idea-spring-tools/releases/latest" | jq -r '.assets[0].browser_download_url')
curl -JOL "$IDEA_SPRING_TOOLS_URL"
# EOF