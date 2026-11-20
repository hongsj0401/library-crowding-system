#!/bin/bash
# ex3-3.sh : 과목별 점수(0~100)를 입력받아 A/B 등급과 평균 등급 출력
# 90 이상 A, 그 외 B

grade() {
    if [ "$(echo "$1 >= 90" | bc -l)" -eq 1 ]; then echo "A"; else echo "B"; fi
}

read -p "과목 수를 입력하세요 (2 이상): " n
if ! [[ "$n" =~ ^[0-9]+$ ]] || [ "$n" -lt 2 ]; then
    echo "오류: 2 이상의 정수를 입력하세요."; exit 1
fi

sum=0
for ((i = 1; i <= n; i++)); do
    while true; do
        read -p "  과목 $i 점수 (0~100): " s
        if [[ "$s" =~ ^[0-9]+$ ]] && [ "$s" -ge 0 ] && [ "$s" -le 100 ]; then
            break
        fi
        echo "  → 0~100 사이의 정수를 입력하세요."
    done
    scores[$i]=$s
    sum=$((sum + s))
done

echo "------------------------------"
for ((i = 1; i <= n; i++)); do
    echo "과목 $i : ${scores[$i]}점 → $(grade ${scores[$i]})"
done
avg=$(printf "%.2f" "$(echo "scale=4; $sum / $n" | bc -l)")
echo "------------------------------"
echo "평균 점수 : $avg  → 평균 등급 : $(grade $avg)"
