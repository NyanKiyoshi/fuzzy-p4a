#!/bin/bash

export TIME="%U\t%M"
TEST_COUNT=${TEST_COUNT:-3}
SIZE_SEQUENCES=${SIZE_SEQUENCES:-$(seq 100000 50000 500000)}
TEST_CLS_NAME=Main

[[ -z "$BASEPATH" ]] && BASEPATH=$(dirname ${0})
SRCPATH=$(readlink -f "${BASEPATH}/java")
BUILDDIR=$(readlink -f "${BASEPATH}/../build")
DATADIR=$(readlink -f "${BASEPATH}/../data")

e_failed() {
    echo "$@" >&2
    exit 1
}

usage() {
    e_failed "Usage: [option=value]...

-c=TEST_COUNT, --count=TEST_COUNT: number of time to run each test case. To note
    default is $TEST_COUNT.

-s=SIZE_SEQUENCES, --sizes=SIZE_SEQUENCES: the size sequences to run the program
    against, the sequences are to be separated with a space, e.g. '10 100 1000'.

-t=TEST_CLS_NAME, --test=TEST_CLS_NAME: the java class name to run test against,
    the available names are: Main, and Hypothese. The default value is set Main.

Note: the capitalized value names can be passed as environment variables.\
"
}

for opt in "$@"; do
    case $opt in
        -h|--help)
            usage;;

        -c=*|--count=*)
            TEST_COUNT="${opt#*=}"
            shift;;

        -s=*|--sizes=*)
            SEQUENCES="${opt#*=}"
            shift;;

        -t=*|--test=*)
            TEST_CLS_NAME="${opt#*=}"
            shift;;

        *)
            e_failed "Unknown option: $opt";;
    esac
done

time=$(which time) || e_failed 'Missing time runtime'

# usage: randrange MIN MAX
randrange() {
    RANGE=$(( $2 - $1 + 1 ))
    echo $(( ( $RANDOM % $RANGE ) + $1 ))
}

build_sources() {
    mkdir -p "${BUILDDIR}" \
        && javac -d ${BUILDDIR} "${SRCPATH}/$TEST_CLS_NAME.java"
}

benchmark() {
    echo -e "testid\tsize\top\ttype\tetime\tmem"
    cd $BUILDDIR

    for size in $SIZE_SEQUENCES; do
        for testid in $(seq 1 $TEST_COUNT); do
            for op in {0..2}; do
                for interface in {0..2}; do (
                        res=`($time java "$TEST_CLS_NAME" $interface $op $size > /dev/null) 2>&1`
                        echo -e "$testid\t$size\t$op\t$interface\t$res"

                    ) &
                done
            done
            wait
        done
    done
}

build_sources && benchmark || e_failed 'Execution failed'

