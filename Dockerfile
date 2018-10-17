FROM python:3.7.0-alpine3.8

COPY requirements.txt /

RUN apk --update add --virtual build-dependencies gcc libressl-dev libffi-dev musl-dev \
  && pip install -r requirements.txt \
  && apk del build-dependencies

COPY controller.py functions.py /

CMD ["python", "-u", "controller.py"]
