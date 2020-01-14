#!/bin/bash

# -----------------------------------------------------------------
# ------------------------------ BUILD ----------------------------
# -----------------------------------------------------------------

# clean project
chmod +x gradlew
gradle clean --stacktrace

# build
if [ $buildType = 'debug' ]; then
	./gradlew assembleDebug --stacktrace
elif [ $buildType = 'release' ]; then
	./gradlew assembleRelease --stacktrace
fi

# -----------------------------------------------------------------
# -------------------------- TESTS & LINT--------------------------
# -----------------------------------------------------------------
# lint
./gradlew lint

# run junit test
if [ $buildType = 'debug' ]; then
    ./gradlew testDebugUnitTest --stacktrace
elif [ $buildType = 'release' ]; then
    ./gradlew testReleaseUnitTest --stacktrace
fi

# -----------------------------------------------------------------
# -------------------------- POST BUILD ---------------------------
# -----------------------------------------------------------------
apkFileName="app-$buildType.apk"
rm -r artifacts/
rm -r report/
mkdir artifacts
mkdir report
mkdir report/test-results

# copy apk to artifacts
if [ ! -e "app/build/outputs/apk/$buildType/$apkFileName" ]; then
    echo "ERROR: File not exists: (app/build/outputs/apk/$buildType/$apkFileName)"
    exit 1
fi
cp app/build/outputs/apk/$buildType/$apkFileName artifacts/

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
    if [ $buildType = 'debug' ]; then
        testsDir="$module/build/test-results/testDebugUnitTest"
    elif [ $buildType = 'release' ]; then
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