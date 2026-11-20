#!/bin/bash
# ex3-8.sh : 팀원 이름과 생일/전화번호를 DB.txt 에 기록
# 사용법: ./ex3-8.sh 이름 정보       → DB.txt 에 추가
#         ./ex3-8.sh -n 이름 정보    → DB.txt 를 처음부터 다시 작성

DB="DB.txt"

if [ "$1" = "-n" ]; then
    shift
    : > "$DB"
    echo "[새로 작성] $DB 를 초기화했습니다."
fi

if [ $# -ne 2 ]; then
    echo "사용법: $0 [-n] <이름> <생일 또는 전화번호>"
    exit 1
fi

echo "$1 $2" >> "$DB"
echo "[추가] $1 $2"
echo "--- 현재 $DB ($(wc -l < "$DB")명) ---"
cat "$DB"
