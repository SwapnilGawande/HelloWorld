curl --verbose \
     --fail \
     --form "status=2" \
     --form "notify=1” \
     --form "notes=Note” \
     --form "notes_type=1" \
     --form "ipa=/Users/swapnil/Swapnil/DevOps/HelloWorld/app/build/outputs/apk/debug/app-debug.apk" \
     --form "tags=QA Build” \
     --form "release_type=2" \
     --header "X-HockeyAppToken: d7f1a450e8fa60fc0e2696a2cfb829a511562b33" \
"https://rink.hockeyapp.net/api/2/apps/b1d55578-6e0e-47fa-a058-47ba30d78a10/app_versions"