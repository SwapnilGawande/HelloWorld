curl \
-F "status=2" \
-F "notes=CircleCI" \
-F "notify=1" \
-F "ipa=/home/circleci/project/outputs/outputs/apk/debug/app-debug.apk" \
-H "X-HockeyAppToken:39dc03e52b423663dadae939b76d4506eedd00d7" \
"https://rink.hockeyapp.net/api/2/apps/b1d55578-6e0e-47fa-a058-47ba30d78a10/app_versions"
