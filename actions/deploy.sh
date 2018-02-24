#!/bin/sh

readonly local PACKNAME=$1
readonly local FILE_FORMAT=$2
readonly local FILE_NAME=$PACKNAME.$FILE_FORMAT

git archive --format=$FILE_FORMAT https://github.com/pgmgonta/st2packs/$PACKNAME HEAD > $FILE_NAME

gsutil cp $FILE_NAME  gs://stackstorm-deploy-test/packs/
