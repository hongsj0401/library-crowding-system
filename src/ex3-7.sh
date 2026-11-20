#!/bin/bash
# ex3-7.sh : 입력된 이름의 폴더에 파일 5개 생성 → 파일 이름대로 하위 폴더 생성 → 각 폴더에 파일 링크
# 사용법: ./ex3-7.sh 폴더이름

if [ $# -ne 1 ]; then echo "사용법: $0 <폴더이름>"; exit 1; fi
dir=$1

mkdir -p "$dir"
cd "$dir" || exit 1

for i in 0 1 2 3 4; do
    f="file$i.txt"
    echo "content of $f" > "$f"
    sub="${f%.txt}"            # 확장자를 뗀 이름으로 하위 폴더 생성
    mkdir -p "$sub"
    ln -sf "../$f" "$sub/$f"  # 상위 폴더의 원본 파일을 심볼릭 링크
    echo "$f → $sub/$f 링크 생성"
done

echo "--- 폴더 구조 ---"
ls -F
for d in */; do
    ls -l "$d" | grep -- '->' | awk -v d="$d" '{print d $9, $10, $11}'
done
echo "--- 링크를 통해 파일 읽기 (cat file2/file2.txt) ---"
cat file2/file2.txt
