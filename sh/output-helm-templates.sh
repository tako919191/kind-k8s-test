#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0);pwd)

while read -r chart; do

    echo "Output template at ${chart}"
    CURRENT_CHART=$(basename ${chart})
    echo "Chart: ${CURRENT_CHART}"

    while read -r valuefile; do

        echo "Valuefile: $valuefile"
        helm template $chart -f $valuefile > $CURRENT_DIR/../out/template-$CURRENT_CHART-$(basename $valuefile)

    done < <(find $CURRENT_DIR/../values/$CURRENT_CHART -type f -name "*.yaml")

done < <(find $CURRENT_DIR/../charts -mindepth 1 -maxdepth 1)
