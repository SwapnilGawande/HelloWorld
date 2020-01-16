
AndroidAppId=${1:-ff47c175b55cfbab58837bb66656b50a186ab06d}
HockeyAppToken=9297faf4da2a149a865bb60c5d42f175e95c1207
TAGS=${3:-}

curl \
-F "status=2" \
-F "notify=0" \
-F "notes_type=1" \
-F "notes=%23+$CIRCLE_BRANCH%0D%0A$CIRCLE_SHA1%0D%0A$CIRCLE_REPOSITORY_URL" \
-F "repository_url=$CIRCLE_REPOSITORY_URL" \
-F "build_server_url=$CIRCLE_BUILD_URL" \
-F "commit_sha=$CIRCLE_SHA1" \
-F "ipa=@${2:-app/build/outputs/apk/app-debug.apk}" \
-F "tags=$TAGS" \
-H "X-HockeyAppToken: $HockeyAppToken" \
https://rink.hockeyapp.net/api/2/apps/$AndroidAppId/app_versions/upload
