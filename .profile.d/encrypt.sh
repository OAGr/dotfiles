#!/bin/bash
set -e

EXPECTED_ARGS=1
if [ $# -ne $EXPECTED_ARGS ]
then
    echo "Must have 1 argument:"
    echo "$0 [file-to-encrypt]"
    exit
fi


CWD=`pwd`

cd gpg/dev-ops/
# find all the .pub files in the gpg folder, and chain them with -r's
RECIPS=`find . -type f | tr \\\n ' ' | sed -e's/.\\//-r /g' | sed -e's/.pub//g'`

cd $CWD
gpg --batch --yes --use-agent -e -q --trust-model always $RECIPS -q $1

echo done encrypting $1
echo "CTRL-C to stop or any key to remove ${1}?"
read
rm $1
