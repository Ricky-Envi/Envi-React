# base image
FROM node:12.2.0

# set working directory
WORKDIR /app
ADD package.json /app/package.json

# `/app/node_modules/.bin`을 $PATH 에 추가
ENV PATH /app/node_modules/.bin:$PATH

# app dependencies, install 및 caching
COPY package.json /app/package.json
RUN npm install
RUN npm install react-scripts@1.1.0 -g

COPY . .

# 포트 노출
EXPOSE 3000

# 앱 실행
CMD ["npm", "start"]
