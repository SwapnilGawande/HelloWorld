curl \
-F "status=2" \
-F "notes=CircleCI" \
-F "notify=1" \
-F "ipa=/home/circleci/project/outputs/outputs/apk/debug/app-debug.apk" \
-H "X-HockeyAppToken:d7f1a450e8fa60fc0e2696a2cfb829a511562b33" \
"https://rink.hockeyapp.net/api/2/apps/b1d55578-6e0e-47fa-a058-47ba30d78a10/app_versions"
