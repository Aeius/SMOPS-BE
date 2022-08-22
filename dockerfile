FROM python:3.10.0-alpine
# 장고를 설정할 때 필요한 코드들
ENV PYTHONDONTWRITEBYTECODE=1
# ㄴ 소스코드가 컴파일될 때 생성되는 파일 중 docker에서 필요하지않은 파일들을 생성되지 않도록 설정
ENV PYTHONUNBUFFERED=1
# ㄴ 파이썬 로고가 즉각적으로 로드되도록 설정

RUN apk update
# ㄴ alpine linux 패키지 업데이트 (pip ≒ apk )
RUN apk add build-base python3-dev py-pip jpeg-dev zlib-dev libpq-dev
# ㄴ 이후 build 시 필요한 모듈들을 추가로 작성해주면된다. 구글링을 통해서 적절한 패키지들을 추가하여야만 build가 된다.

COPY requirements.txt /usr/src/app/
# ㄴ 컨테이너에 requirements.txt 복사

WORKDIR /usr/src/app
# ㄴ 작업 위치 이동 후 패키지 설치
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /usr/src/app/
# ㄴ 현재 폴더에 있는 것들을(. 으로 경로 표시)들을 /user/scr/app/ 에 복사 