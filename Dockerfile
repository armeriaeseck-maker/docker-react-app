FROM node:22-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN mkdir data
ENV API_URL=https://api.monapp.com
COPY . .
EXPOSE 3000
RUN addgroup -S app && adduser -S -G app app
RUN chown -R app:app /app
USER app
ENTRYPOINT ["npm", "run", "dev", "--", "--host"]