# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Clean previous installs, clear npm cache, and install fresh dependencies
RUN rm -rf node_modules package-lock.json && \
    npm cache clean --force && \
    npm install --force

# Install nodemon globally
RUN npm install -g nodemon

# Register new commands to discord
RUN npm run register

# Copy the rest of the application files
COPY . .

# Expose the port
EXPOSE 3000

# Use nodemon to watch for changes
CMD ["nodemon", "--legacy-watch", "index.js"]

