FROM nikolaik/python-nodejs:python3.10-nodejs18-bullseye

COPY . /app
WORKDIR /app
RUN

RUN python -m pip install -r requirements.txt
