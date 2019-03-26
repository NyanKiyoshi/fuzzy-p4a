#!/bin/bash
source "$(dirname ${0})/variables.sh"

export TIME="%U\t%M"

time=$(which time) || {
    echo 'Missing time runtime' >&2
    exit 1
}

# usage: randrange MIN MAX
randrange() {
    RANGE=$(( $2 - $1 + 1 ))
    echo $(( ( $RANDOM % $RANGE ) + $1 ))
}

echo -e "testid\tsize\top\ttype\tetime\tmem"

cd $BUILDDIR

TEST_COUNT=${1:-20}

for testid in $(seq $TEST_COUNT); do
    size=$(randrange 1 9)00000

    for op in {0..2}; do
        for interface in {0..2}; do
            (
                res=`($time java Main $interface $op $size > /dev/null) 2>&1`
                echo -e "$testid\t$size\t$op\t$interface\t$res"
            ) &
        done
    done

    wait
done

