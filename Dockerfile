# Multi step docker paradigm
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# Output of the builder is available in /app/build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html