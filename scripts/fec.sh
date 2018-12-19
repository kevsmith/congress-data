#!/bin/bash

SCRIPT_DIR=$(cd $(dirname ${0});pwd)

source ${SCRIPT_DIR}/fec_common.sh

func_name="fec_${DS_NAME}_url"
header_func_name="fec_${DS_NAME}_header_url"

mkdir -p ${DATA_DIR}/${DS_NAME} && cd ${DATA_DIR}/${DS_NAME}

wget_opts="-t2 -nv -nd -N"

for year in ${SHORT_YEARS}
do
    url=$(${func_name} ${year})
    echo "Fetching ${url}"
    wget ${wget_opts} ${url}
done

type ${header_func_name} >& /dev/null
if [ "${?}" == "0" ]; then
    url=$(${header_func_name})
    echo "Fetching ${url}"
    wget ${wget_opts} ${url}
fi
echo "Done"
