FROM nikolaik/python-nodejs:python3.10-nodejs18-bullseye

COPY . /app
WORKDIR /app

RUN python -m pip install -r requirements.txt

RUN cd ./portfolio_vue && \
    npm init -y && \
    npm install --save-dev webpack-chain && \
    npm install --global @vue/cli && \
    npm install --global @vue/cli-service && \
    npm install --global @vue/cli-plugin-babel && \
    npm install --global vue@next && \
    npm add webpack-bundle-tracker --include=dev --save-dev \
    npm run build && \
    cd ..