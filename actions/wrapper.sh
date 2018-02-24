#!/bin/sh

set -xe

usage_exit(){
  echo "error"
  exit
}

while getopts ad:h OPT
do
    case $OPT in
        --x-entory_point) 
            ENTORY_POINT=$OPTARG
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done

mkdir -p $HOME/workspace/packs/
cd $HOME/workspace/packs/

gsutil cp gs://stackstorm-deploy-test/packs/${ST2_ACTION_PACK_NAME}

tar -zxf ${ST2_ACTION_PACK_NAME}.tar.gz
cd ${ST2_ACTION_PACK_NAME}

virtualenv env
source ./env/bin/activate

pip install -r requirements.txt

./$ENTORY_POINT "$@"

