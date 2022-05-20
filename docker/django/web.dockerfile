ARG PYTHON_VERSION=3.10.4-bullseye

FROM python:$PYTHON_VERSION
ENV PYTHONUNBUFFERED=1
WORKDIR /app

COPY requirements.txt requirements.txt

RUN python -m pip install -r requirements.txt

COPY . /app

RUN python /app/manage.py collectstatic --noinput

EXPOSE 8000