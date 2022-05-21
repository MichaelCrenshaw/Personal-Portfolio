ARG PYTHON_VERSION=python3.10-nodejs18-bullseye

FROM nikolaik/python-nodejs:$PYTHON_VERSION
ENV PYTHONUNBUFFERED=1

RUN npm install --global @vue/cli

COPY . /app
WORKDIR /app

RUN python -m pip install -r requirements.txt && \
    python /app/manage.py collectstatic --noinput

EXPOSE 8000