#!/bin/bash
# ex3-4.sh : 메뉴를 반복 출력하며 성적 관리 (5 입력 시 종료)

subjects=()
scores=()

to_gpa() {   # 4.5 만점 기준
    local s=$1
    if   [ "$s" -ge 95 ]; then echo "A+ 4.5"
    elif [ "$s" -ge 90 ]; then echo "A0 4.0"
    elif [ "$s" -ge 85 ]; then echo "B+ 3.5"
    elif [ "$s" -ge 80 ]; then echo "B0 3.0"
    elif [ "$s" -ge 75 ]; then echo "C+ 2.5"
    elif [ "$s" -ge 70 ]; then echo "C0 2.0"
    elif [ "$s" -ge 65 ]; then echo "D+ 1.5"
    elif [ "$s" -ge 60 ]; then echo "D0 1.0"
    else                       echo "F 0.0"
    fi
}

while true; do
    echo "==================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "==================="
    read -p "메뉴 선택 (1~5): " menu

    case "$menu" in
        1)
            read -p "과목 이름: " name
            read -p "점수 (0~100): " s
            if [[ "$s" =~ ^[0-9]+$ ]] && [ "$s" -le 100 ]; then
                subjects+=("$name"); scores+=("$s")
                echo "→ '$name' $s점 추가 완료"
            else
                echo "→ 잘못된 점수입니다."
            fi
            ;;
        2)
            if [ ${#scores[@]} -eq 0 ]; then echo "→ 입력된 성적이 없습니다."; continue; fi
            for i in "${!scores[@]}"; do
                echo "  $((i + 1)). ${subjects[$i]} : ${scores[$i]}점"
            done
            ;;
        3)
            if [ ${#scores[@]} -eq 0 ]; then echo "→ 입력된 성적이 없습니다."; continue; fi
            sum=0
            for s in "${scores[@]}"; do sum=$((sum + s)); done
            echo "→ 평균 점수: $(echo "scale=2; $sum / ${#scores[@]}" | bc -l)점 (${#scores[@]}과목)"
            ;;
        4)
            if [ ${#scores[@]} -eq 0 ]; then echo "→ 입력된 성적이 없습니다."; continue; fi
            total=0
            for i in "${!scores[@]}"; do
                read -r letter point <<< "$(to_gpa ${scores[$i]})"
                echo "  ${subjects[$i]} : ${scores[$i]}점 → $letter ($point)"
                total=$(echo "$total + $point" | bc -l)
            done
            echo "→ 평균 GPA: $(echo "scale=2; $total / ${#scores[@]}" | bc -l) / 4.5"
            ;;
        5)
            echo "프로그램을 종료합니다."
            break
            ;;
        *)
            echo "→ 1~5 사이의 숫자를 입력하세요."
            ;;
    esac
done
