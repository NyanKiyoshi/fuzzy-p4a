#!/bin/bash
BASEPATH=./src/

cd "$(dirname ${0})"
source ${BASEPATH}/variables.sh

${BASEPATH}/benchmark.sh > "${DATADIR}/benchmark.data"

( cd ${BASEPATH}/plots/ && Rscript main.r )
