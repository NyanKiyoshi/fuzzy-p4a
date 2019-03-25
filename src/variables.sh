[[ -z "$BASEPATH" ]] && BASEPATH=$(dirname ${0})
SRCPATH=$(readlink -f "${BASEPATH}/java")
BUILDDIR=$(readlink -f "${BASEPATH}/build")
DATADIR=$(readlink -f "${BASEPATH}/../data")

