#!/bin/bash
source "$(dirname ${0})/variables.sh"

mkdir -p "${BUILDDIR}" \
    && javac -d ${BUILDDIR} ${SRCPATH}/Main.java

exit $?

