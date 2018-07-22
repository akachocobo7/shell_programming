#!/bin/sh

if [ "$1" = "" ];then
    echo "投票数を入力してください"
    read n
else
    n=$1
fi

if (( n < 1 ));then
    echo "終了します"
    exit 0
fi

declare -A hash_
for((i=0; i<$n; i++));do
    read word
    while [ "$word" = "" ]
    do
        echo "空文字列になっています。もう一度入力して下さい。"
        read word
    done
    hash_[$word]+=1
done

max=0
for i in ${hash_[@]};do
    if (( max < ${#i} ));then
        max=${#i}
    fi
done

echo "一番投票が多かったのは"
for i in ${!hash_[@]}; do
    if (( max == ${#hash_[$i]} ));then
        echo $i
    fi
done
echo "です"
