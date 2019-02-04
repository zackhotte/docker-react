# Build Phase
FROM node:alpine AS builder

WORKDIR /app
COPY package.json .

RUN npm install

COPY . .

RUN npm run build
# /app/build <--- all the stuff

# Run Phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
