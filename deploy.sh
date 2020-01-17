curl \
-F "status=2" \
-F "notes=CircleCI" \
-F "notify=1" \
-F "ipa=/home/circleci/project/outputs/outputs/apk/debug/app-debug.apk" \
-H "X-HockeyAppToken: ff47c175b55cfbab58837bb66656b50a186ab06d" \
https://rink.hockeyapp.net/api/2/apps/f6e0bf05-8c6d-4287-b9f4-77826b34686a/app_versions/
