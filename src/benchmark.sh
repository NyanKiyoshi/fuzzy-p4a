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

for size in $(seq 100000 50000 500000); do
    for testid in {1..3}; do
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
done

