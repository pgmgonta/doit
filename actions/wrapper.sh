#!/bin/sh -ex

usage_exit(){
  echo "error"
  exit
}

ENTORY_POINT=python_test.py

readonly local WORK_DIR=$HOME/workspace/packs/${ST2_ACTION_PACK_NAME}
mkdir -p $WORK_DIR 
cd $WORK_DIR
gsutil cp gs://stackstorm-deploy-test/packs/${ST2_ACTION_PACK_NAME}.tar.gz $WORK_DIR
tar -zxf ${ST2_ACTION_PACK_NAME}.tar.gz

virtualenv env
source ./env/bin/activate

pip install -r requirements.txt

$WORK_DIR/actions/$ENTORY_POINT "$@"
