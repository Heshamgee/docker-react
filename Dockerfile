FROM node:alpine as builder 
WORKDIR '/fronentend'
COPY package.json . 
RUN npm insstall
COPY . . 
RUN npm run build 

FROM nginx 
COPY --from=builder /fronetend/build /usr/share/nginx/html 
 
