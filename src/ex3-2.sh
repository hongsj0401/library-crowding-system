#!/bin/bash
# ex3-2.sh : y = (1/2) x^2 의 값을 실수 범위에서 계산
# 사용법: ./ex3-2.sh  → x 값들을 공백으로 구분해 2개 이상 입력

read -p "x 값들을 입력하세요 (공백 구분, 2개 이상): " -a xs

if [ ${#xs[@]} -lt 2 ]; then
    echo "오류: 값을 2개 이상 입력해야 합니다."
    exit 1
fi

for x in "${xs[@]}"; do
    if ! [[ "$x" =~ ^-?[0-9]*\.?[0-9]+$ ]]; then
        echo "x = $x  →  숫자가 아니므로 건너뜁니다."
        continue
    fi
    y=$(echo "scale=4; 0.5 * $x * $x" | bc -l)
    printf "x = %-8s →  y = 1/2 * x^2 = %.4f\n" "$x" "$y"
done
