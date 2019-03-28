#!/bin/bash
BASEPATH=./src/

cd "$(dirname ${0})"

BASEPATH="./src"
BENCHFILE="./data/benchmark.data"

${BASEPATH}/benchmark.sh -t=Hypothese $@ > $BENCHFILE && \
    ( cd ${BASEPATH}/plots/ && Rscript main.r Hypothese )

