FROM node:24-alpine AS build 
ADD . /nodeapp
WORKDIR /nodeapp
RUN npm install && \
    npm run build
FROM nginx:alpine AS runtime 
LABEL project="nodejsproject"
COPY --from=build /nodeapp/build   /usr/share/nginx/html
EXPOSE 80  