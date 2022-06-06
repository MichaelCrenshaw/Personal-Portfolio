ARG PYTHON_VERSION=python3.10-nodejs18-bullseye

FROM python:$PYTHON_VERSION
ENV PYTHONUNBUFFERED=1

COPY . /app
WORKDIR /app

RUN python -m pip install -r requirements.txt && \
    python /app/manage.py collectstatic --noinput
