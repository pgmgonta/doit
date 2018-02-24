#!/bin/sh -ex


readonly local WORK_DIR=/tmp/
readonly local PACKNAME=${ST2_ACTION_PACK_NAME}
readonly local FILE_FORMAT=tar.gz
readonly local FILE_NAME=$PACKNAME.$FILE_FORMAT
readonly local GIT_REPO=https://github.com/pgmgonta/$PACKNAME.git

cd $WORK_DIR
git clone $GIT_REPO
cd $WORK_DIR/$PACKNAME
git archive --format=$FILE_FORMAT HEAD > $FILE_NAME
gsutil cp $FILE_NAME  gs://stackstorm-deploy-test/packs/

cd $WORK_DIR
rm -rf $WORK_DIR/tmp/$PACKNAME
