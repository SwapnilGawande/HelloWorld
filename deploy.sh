curl \
-F "status=2" \
-F "notes=CircleCI" \
-F "notify=1" \
-F "ipa=/home/circleci/project/outputs/outputs/apk/debug/app-debug.apk" \
-H "X-HockeyAppToken:9297faf4da2a149a865bb60c5d42f175e95c1207" \
https://rink.hockeyapp.net/api/2/apps/HelloWorld/app_versions/upload