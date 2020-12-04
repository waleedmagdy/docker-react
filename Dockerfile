# this will run our production container >> this will be multi step build process
FROM node:alpine AS builder
WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
