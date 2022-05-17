ARG PYTHON_VERSION=3.10.4-bullseye

FROM python:$PYTHON_VERSION
COPY . /app
WORKDIR /app
RUN pip install -r /app/requirements.txt
EXPOSE 8080