
def calculate_crowding(total_seats, occupied_seats):
    if total_seats <= 0:                             #오류 발생 제거
        return "전체 좌석 수가 올바르지 않습니다."

    if occupied_seats < 0 or occupied_seats > total_seats:
        return "이용 좌석 수를 확인하세요."

    rate = occupied_seats / total_seats * 100

    if rate >= 70:                            #혼잡도를 나타내는 기준 세우기
        status = "혼잡"
    elif rate >= 30:
        status = "보통"
    else:
        status = "여유"

    return f"이용률: {rate:.1f}% / 상태: {status}"


print(calculate_crowding(100, 75))
