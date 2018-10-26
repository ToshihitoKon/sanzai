#!/bin/bash
#set -x

if [ ! $# -eq 1 ]; then
    echo "usase: $0 [sanzai.csv path]"
    exit
fi

if [ ! -f $1 ]; then
    echo "No such file" $1
    exit
fi

tabs 14

sum=`cat $1 | tail -n +2 | cut -d , -f 3 | awk '{sum+=$1}END{print sum}'`
echo 全散財額合計 `echo $sum  | sed -E 's/([0-9]{3})$/,\1 /g'`
echo

days=(`cat $1 | tail -n +2 | cut -d , -f 1 | sort | uniq | tr '\n' ' '`)
for i in `seq 1 ${#days[@]}`; do
    s=`cat $1 | grep ${days[($i-1)]} | cut -d , -f 3 | awk '{sum+=$1}END{print sum}'`
    p=`echo "scale = 2; ${s} * 100 / ${sum}" | bc`
    days[($i-1)]="${days[($i-1)]}\t$s \t$p%"
done

echo === 日別 ===
for i in "${days[@]}"; do
    echo -e "`echo $i | sed -E 's/([0-9])([0-9]{3}) /\1,\2/g'`"
done
echo

methods=(`cat $1 | tail -n +2 | cut -d , -f 4 | sort | uniq | tr '\n' ' '`)
for i in `seq 1 ${#methods[@]}`; do
    s=`cat $1 | grep ${methods[($i-1)]} | cut -d , -f 3 | awk '{sum+=$1}END{print sum}'`
    p=`echo "scale = 2; ${s} * 100 / ${sum}" | bc`
    methods[($i-1)]="${methods[($i-1)]}\t$s \t$p%"
done

echo === 支払方法別 ===
for i in "${methods[@]}"; do
    echo -e "`echo $i | sed -E 's/([0-9])([0-9]{3})( |$)/\1,\2/g'`"
done

taxonomies=(`cat $1 | tail -n +2 | cut -d , -f 5 | sort | uniq | tr '\n' ' '`)
for i in `seq 1 ${#taxonomies[@]}`; do
    s=`cat $1 | grep ${taxonomies[($i-1)]} | cut -d , -f 3 | awk '{sum+=$1}END{print sum}'`
    p=`echo "scale = 2; ${s} * 100 / ${sum}" | bc`
    taxonomies[($i-1)]="${taxonomies[($i-1)]}\t$s \t$p%"
done
echo

echo === 分類別 ===
for i in "${taxonomies[@]}"; do
    echo -e "`echo $i | sed -E 's/([0-9])([0-9]{3})( |$)/\1,\2/g'`"
done

tabs -0
