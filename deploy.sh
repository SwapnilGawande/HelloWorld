curl \
-F "status=2" \
-F "notes=CircleCI" \
-F "notify=1" \
-F "ipa=/home/circleci/project/outputs/outputs/apk/debug/app-debug.apk" \
-H "X-HockeyAppToken: 0cc5827cfd7fa9920715727ee8698de7b7f3792d" \
https://rink.hockeyapp.net/api/2/apps/HelloWorld/app_versions/upload