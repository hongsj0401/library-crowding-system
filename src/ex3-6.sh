#!/bin/bash
# ex3-6.sh : 입력된 이름의 폴더 확인/생성 → 파일 5개 생성 → 압축 → 새 폴더에 압축 해제
# 사용법: ./ex3-6.sh 폴더이름

if [ $# -ne 1 ]; then echo "사용법: $0 <폴더이름>"; exit 1; fi
dir=$1

if [ -d "$dir" ]; then
    echo "'$dir' 폴더가 이미 존재합니다."
else
    mkdir "$dir"
    echo "'$dir' 폴더가 없어 새로 생성했습니다."
fi

cd "$dir" || exit 1
for i in 0 1 2 3 4; do
    echo "This is file$i" > "file$i.txt"
done
echo "파일 5개 생성: $(ls file*.txt | tr '\n' ' ')"

echo "--- 압축 (tar -czvf $dir.tar.gz) ---"
tar -czvf "$dir.tar.gz" file*.txt

mkdir -p "${dir}_unzip"
echo "--- '${dir}_unzip' 폴더에 압축 해제 ---"
tar -xzvf "$dir.tar.gz" -C "${dir}_unzip"
echo "--- 결과 ---"
ls -F
ls -F "${dir}_unzip"
