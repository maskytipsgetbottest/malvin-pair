FROM node:18-bullseye

# Set working directory
WORKDIR /app

# Install required system packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        imagemagick \
        webp && \
    rm -rf /var/lib/apt/lists/*

# Copy dependency definitions
COPY package*.json ./

# Install node dependencies
RUN npm install --production

# Copy all application code (including index.js, pair.js, qr.js, .html files)
COPY . .

# Expose the port your app actually uses
EXPOSE 5000

# Start app (using npm start, as defined in package.json)
CMD ["npm", "start"]
