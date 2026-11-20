#!/bin/bash
# ex3-5a.sh : 리눅스 시스템 상태 확인 메뉴 (5 입력 시 종료)

while true; do
    echo "=============================="
    echo "1) 사용자 정보"
    echo "2) GPU 또는 CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "=============================="
    read -p "메뉴 선택 (1~5): " menu

    case "$menu" in
        1)
            echo "[사용자 정보]"
            echo "현재 사용자 : $(whoami)"
            id
            echo "호스트 이름 : $(hostname)"
            ;;
        2)
            if command -v nvidia-smi > /dev/null 2>&1; then
                echo "[GPU 사용률]"
                nvidia-smi --query-gpu=name,utilization.gpu,memory.used,memory.total --format=csv
            else
                echo "[CPU 사용률] (GPU 없음 → top 사용)"
                top -bn1 | head -n 12
            fi
            ;;
        3)
            echo "[메모리 사용량]"
            free -h
            ;;
        4)
            echo "[디스크 사용량]"
            df -h /
            echo "--- 현재 폴더 용량 (du) ---"
            du -sh .
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
