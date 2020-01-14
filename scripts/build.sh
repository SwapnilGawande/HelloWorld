#!/bin/bash

# -----------------------------------------------------------------
# ------------------------------ BUILD ----------------------------
# -----------------------------------------------------------------

# clean project
gradle clean --stacktrace

# build
gradle assembleDebug --stacktrace

# -----------------------------------------------------------------
# -------------------------- TESTS & LINT--------------------------
# -----------------------------------------------------------------
# lint
gradle lint

# run junit test
gradle testDebugUnitTest --stacktrace

# -----------------------------------------------------------------
# -------------------------- POST BUILD ---------------------------
# -----------------------------------------------------------------
apkFileName="app-debug.apk"
rm -r artifacts/
rm -r report/
mkdir artifacts
mkdir report
mkdir report/test-results

# copy apk to artifacts
if [ ! -e "app/build/outputs/apk/debug/$apkFileName" ]; then
    echo "ERROR: File not exists: (app/build/outputs/apk/debug/$apkFileName)"
    exit 1
fi
cp app/build/outputs/apk/debug/$apkFileName artifacts/

# copy lint results
if [ ! -e "app/build/reports/lint-results.xml" ]; then
    echo "ERROR: File not exists: (app/build/reports/lint-results.xml)"
    exit 1
fi
cp app/build/reports/lint-results.xml report/

# copy tests results from all modules
modules=("app" "common")
for module in "${modules[@]}"
do

    testsDir=""
    if [ debug = 'debug' ]; then
        testsDir="$module/build/test-results/testDebugUnitTest"
    elif [ debug = 'release' ]; then
        testsDir="$module/build/test-results/testReleaseUnitTest"
    fi

    if [ ! "$(ls -A $testsDir)" ]; then
        echo "Unit tests report wasn't found for module: $module"
        continue
    fi

    # copy all files inside, to our folder
    cp $testsDir/* report/test-results/

done

cat << "EOF"

EOF