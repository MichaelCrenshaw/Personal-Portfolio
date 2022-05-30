ARG PYTHON_VERSION=python3.10-nodejs18-bullseye

FROM nikolaik/python-nodejs:$PYTHON_VERSION
ENV PYTHONUNBUFFERED=1

#RUN npm init -y && \
#    npm install --global @vue/cli && \
#    npm install --global @vue/cli-service && \
#    npm install --global vue@next && \
#    npm add webpack-bundle-tracker --include=dev --save-dev

COPY . /app
WORKDIR /app

RUN cd ./portfolio_vue && \
    npm init -y && \
    npm install --global @vue/cli && \
    npm install --global @vue/cli-service && \
    npm install --global vue@next && \
    npm add webpack-bundle-tracker --include=dev --save-dev \
    npm run build && \
    cd ..

RUN python -m pip install -r requirements.txt && \
    python /app/manage.py collectstatic --noinput

EXPOSE 8000