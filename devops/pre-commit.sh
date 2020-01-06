#!/bin/sh

echo "Running static analysis..."

# Inspect code using Detekt
./gradlew app:detektCheck --daemon

status=$?

if [ "$status" = 0 ] ; then
    echo "Static analysis found no problems."
    exit 0
else
    echo 1>&2 "Static analysis found violations it could not fix."
    exit 1
fi