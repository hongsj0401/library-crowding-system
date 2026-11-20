#!/bin/bash
# ex3-9.sh : 이름으로 DB.txt 를 검색해 팀원 정보 출력
# 사용법: ./ex3-9.sh 검색어

DB="DB.txt"

if [ $# -ne 1 ]; then echo "사용법: $0 <이름>"; exit 1; fi
if [ ! -f "$DB" ]; then echo "$DB 파일이 없습니다. ex3-8.sh 로 먼저 등록하세요."; exit 1; fi

result=$(grep -i -- "^[^ ]*$1[^ ]* " "$DB")
if [ -n "$result" ]; then
    echo "$result"
else
    echo "'$1' 에 해당하는 팀원이 없습니다."
fi
