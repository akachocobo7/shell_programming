if [ "$1" = "" ];
then
    a=1
    b=100
else
    if [ "$2" = "" ];
    then
        a=1
        b=$1
    else
        a=$1
        b=$2
    fi
fi

if (( a < 1 ));
then
   echo "1以上の整数を入力してください"
   a=1
fi

if (( b > 100 ));
then
    echo "100以下の整数を入力してください"
    b=100
fi

number=()
for i in {0..600}; do
    number=("${number[@]}" $i)
done

prime=()
for i in {2..600}; do
    x=${number[i]}
    if (( x == 0 ));
    then
        continue
    fi

    prime=("${prime[@]}" $x)
    for((j=x*2; j<=600; j+=x)); do
        unset number[j]
    done
done

for((i=$a-1; i<$b; i++)); do
    echo ${prime[i]}
done
