FROM node:18.17.0-slim
# Change working directory

RUN apt update && apt install -y git
WORKDIR /app

# Copy source code
COPY . /app

# Install dependencies
RUN npm install && npm run build

CMD ["npm","start"]

