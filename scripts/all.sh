#!/bin/sh

CUR_DIR=$(pwd)
SCRIPT_DIR=$(cd $(dirname ${0}) && pwd)

finish() {
  cd ${CUR_DIR}
}

trap finish EXIT

echo ${SCRIPT_DIR}
cd ${SCRIPT_DIR}

echo "Running candidate_master.sh"
./candidate_master.sh

echo "Running candidate_committee.sh"
./candidate_committee.sh

echo "Running committee_master.sh"
./committee_master.sh

echo "Running pac_summary.sh"
./pac_summary.sh

echo "Running individual_contrib.sh"
./individual_contrib.sh

echo "Running candidate_contrib.sh"
./candidate_contrib.sh

echo "Running committee_transactions.sh"
./committee_transactions.sh

echo "Running operating_exps.sh"
./operating_exps.sh

