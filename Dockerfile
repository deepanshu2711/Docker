#base image
FROM node:18-alpine
#set working directory  Sets the working directory for any RUN, CMD, ENTRYPOINT, COPYinstructions that follow it.
WORKDIR /app
#copy everything from the current directory to the working directory inside the container
COPY . .

RUN npm install
RUN npm run build

#This is the port number that the container will expose and will be accessible from outside the container.
EXPOSE 3000



# This is the command runs when the container starts up.
CMD ["node" , "dist/index.js"]