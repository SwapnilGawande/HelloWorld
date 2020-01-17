curl \
-F "status=2" \
-F "notify=1" \
-F "ipa=@${2:-app/build/outputs/apk/debug/app-debug.apk}" \
-H "X-HockeyAppToken:ff47c175b55cfbab58837bb66656b50a186ab06d" \
https://rink.hockeyapp.net/api/2/apps/HelloWorld/app_versions/upload