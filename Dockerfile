# FIRST STAGE
# Setting the bigger image as base in first stage
FROM node:18 AS builder

# Creating and setting a new directory as working dir
WORKDIR /app

# Copying all the files of application from host to /app in image
COPY . .

# Runs npm install to install all dependencies listed in package.json
RUN npm install



# SECOND STAGE
# Setting the base image
FROM node:18-alpine

# Creating and setting a new dir as working dir
WORKDIR /app

# Copying all files from /app of stage to the /app we created
COPY --from=builder /app .

# Opening the required port for application
EXPOSE 5173

# Command to keep the created container running
CMD ["npm","run","dev"]