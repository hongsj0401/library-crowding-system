#!/bin/bash
# ex3-0.sh : MYENV 환경변수를 ~/.bashrc 에 등록/해제하고 현재 값을 확인
# 사용법: ./ex3-0.sh set | unset | (인자 없음: 값 확인)

BASHRC="$HOME/.bashrc"
LINE='export MYENV="Hello Shell"'

case "$1" in
    set)
        if grep -q '^export MYENV=' "$BASHRC" 2>/dev/null; then
            echo "[알림] 이미 ~/.bashrc 에 등록되어 있습니다."
        else
            echo "$LINE" >> "$BASHRC"
            echo "[등록] ~/.bashrc 에 '$LINE' 추가 완료"
        fi
        echo "→ 현재 터미널에 적용하려면: source ~/.bashrc"
        ;;
    unset)
        sed -i '/^export MYENV=/d' "$BASHRC"
        echo "[해제] ~/.bashrc 에서 MYENV 제거 완료"
        echo "→ 현재 터미널에서도 지우려면: unset MYENV"
        ;;
    *)
        if [ -n "${MYENV+x}" ]; then
            echo "MYENV = \"$MYENV\"  (셸 파일에서도 값이 유지됨)"
        else
            echo "MYENV 가 설정되어 있지 않습니다."
        fi
        ;;
esac
