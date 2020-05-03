FROM node:alpine as builder

WORKDIR /usr/app/frontend

COPY package.json .
RUN npm install

COPY . . 

CMD ["npm","run","build"]


FROM nginx:alpine

WORKDIR /usr/app/ngnixapp

COPY --from=builder /usr/app/frontend/build /usr/share/nginx/html


