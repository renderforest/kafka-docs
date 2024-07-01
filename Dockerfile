FROM node:18.17.0-slim
# Change working directory
WORKDIR /app

# Copy source code
COPY . /app

# Install dependencies
RUN npm install

CMD ["npm","start"]

