#!/bin/sh
echo "Current directory: $(pwd)"
if [ -x ./writer ]; then
    echo "./writer exists and is executable"
else
    echo "./writer does not exist or is not executable"
fi
make
./writer $1 $2
exit $?
