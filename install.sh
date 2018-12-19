#!/bin/sh

curdir=$(pwd)

finish() {
    cd ${curdir}
}

CMDS="candidate_master candidate_committee committee_master"
CMDS="${CMDS} pac_summary individual_contrib candidate_contrib"
CMDS="${CMDS} committee_transactions operating_exps"

trap finish EXIT

mkdir data

cd scripts
chmod +x fec.sh

cat << 'EOF' > all.sh
#!/bin/sh

CUR_DIR=$(pwd)
SCRIPT_DIR=$(cd $(dirname ${0}) && pwd)

finish() {
  cd ${CUR_DIR}
}

trap finish EXIT

echo ${SCRIPT_DIR}
cd ${SCRIPT_DIR}

EOF

for cmd in ${CMDS}
do
    if [ ! -f ${cmd}.sh ]; then
        ln -s fec.sh ${cmd}.sh
    fi
    echo "echo \"Running ${cmd}.sh\"" >> all.sh
    echo "./${cmd}.sh" >> all.sh
    echo "" >> all.sh
done

chmod +x all.sh
