#!/bin/bash
BASEPATH=./src/

cd "$(dirname ${0})"
source ${BASEPATH}/variables.sh

BENCHFILE="${DATADIR}/benchmark.data"

${BASEPATH}/benchmark.sh $@ > $BENCHFILE

( cd ${BASEPATH}/plots/ && Rscript main.r )

