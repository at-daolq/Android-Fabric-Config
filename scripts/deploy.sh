#!/usr/bin/env bash

NOTE_FILE_NAME="release_notes.txt"
rm "$NOTE_FILE_NAME"

echo "================================================"
echo "Tag name: ${CIRCLE_TAG}"
echo "================================================"

#Get tag url
REQUEST_URL="https://api.github.com/repos/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}/releases/tags/${CIRCLE_TAG}"

echo "================================================"
echo "Request Url: ${REQUEST_URL}"
echo "================================================"

#Print tag name to file
echo $CIRCLE_TAG > "$NOTE_FILE_NAME"
echo "\n" >> "$NOTE_FILE_NAME"

#Request api
curl -H "Authorization: token $GITHUB_ACCESS_TOKEN" "${REQUEST_URL}" \
| python -c 'import json,sys;obj=json.load(sys.stdin);print obj["body"];' >> "$NOTE_FILE_NAME"

#Upload fabric beta
./gradlew :app:assembleDebug crashlyticsUploadDistributionDebug