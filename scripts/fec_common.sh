#!/bin/bash

CUR_DIR=$(pwd)

TOP_DIR=$(cd ${SCRIPT_DIR}/.. && pwd)
DATA_DIR=$TOP_DIR/data

DS_NAME=$(basename ${0})
DS_NAME=${DS_NAME%.*}

SHORT_YEARS="18 16 14 12 10 08 06 04 02 00"
SHORT_YEARS="${SHORT_YEARS} 98 96 94 92 90 88 86"
SHORT_YEARS="${SHORT_YEARS} 84 82 80"

function cleanup {
    cd ${CUR_DIR}
}

function full_year {
    case ${1} in
        1*)
          echo "20${1}"
          ;;
        0*)
          echo "20${1}"
          ;;
        *)
          echo "19${1}"
          ;;
    esac
}

function fec_bulk_url {
    type=${1}
    if [ "${1}" == "pas" ]; then
        type="${type}2"
    fi
    fy=$(full_year ${2})
    echo "https://www.fec.gov/files/bulk-downloads/${fy}/${type}${2}.zip"
}

function fec_header_url {
    type=${1}
    if [ "${1}" == "pas" ]; then
        type="${type}2"
    fi
    echo "https://www.fec.gov/data/advanced/files/bulk-downloads/data_dictionaries/${type}_header_file.csv"
}

function fec_candidate_master_url {
    fec_bulk_url "cn" ${1}
}

function fec_candidate_master_header_url {
    fec_header_url "cn"
}

function fec_candidate_committee_url {
    fec_bulk_url "ccl" ${1}
}

function fec_candidate_committee_header_url {
    fec_header_url "ccl"
}

function fec_committee_master_url {
    fec_bulk_url "cm" ${1}
}

function fec_committee_master_header_url {
    fec_header_url "cm"
}

function fec_pac_summary_url {
    fec_bulk_url "webk" ${1}
}

function fec_individual_contrib_url {
    fec_bulk_url "indiv" ${1}
}

function fec_individual_contrib_header_url {
    fec_header_url "indiv"
}

function fec_candidate_contrib_url {
    fec_bulk_url "pas" ${1}
}

function fec_candidate_contrib_header_url {
    fec_header_url "pas"
}

function fec_committee_transactions_url {
    fec_bulk_url "oth" ${1}
}

function fec_committee_transactions_header_url {
    fec_header_url "oth"
}

function fec_operating_exps_url {
    fec_bulk_url "oppexp" ${1}
}

function fec_operating_exps_header_url {
    fec_header_url "oppexp"
}

trap cleanup EXIT

