# Use the official Node.js image as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code to the container
COPY . .

# Build your Next.js app
RUN npm run build

# Expose the port that your Next.js app will run on
EXPOSE 3000

# Start your Next.js app
CMD ["npm", "run", "start"]
