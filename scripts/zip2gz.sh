#!/bin/bash

CUR_DIR=$(pwd)

finish() {
  cd ${CUR_DIR}
}

trap finish EXIT

target="${1}"
basedir=$(dirname ${1})
outputdir=${basedir}/converted
basefile=$(basename -s .zip ${1})
datafile=$(zipinfo -1 ${target})
output="${outputdir}/${basefile}.gz"

mkdir -p ${outputdir}
unzip -p ${target} | gzip --best - > ${output}
