#!/bin/bash
cd "$(dirname ${0})"
source ./variables.sh

./benchmark.sh > "${DATADIR}/benchmark.data"

