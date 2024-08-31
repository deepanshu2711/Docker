#base image  layer1  Base layer is the first layer of the image. It contains the operating system and the base set of packages.
FROM node:18-alpine
#set working directory  Sets the working directory for any RUN, CMD, ENTRYPOINT, COPYinstructions that follow it.  Layer2
WORKDIR /app

#copy package.json and package-lock.json files from the current directory to the working directory inside the container Layer3
COPY package* .
# COPY ./prisma .

#install dependencies  Layer4
RUN npm install
# RUN npx primsa generate

#copy everything from the current directory to the working directory inside the container  Layer5
COPY . .

#build the project  Layer6
RUN npm run build

#This is the port number that the container will expose and will be accessible from outside the container.
EXPOSE 3000

# This is the command runs when the container starts up.
CMD ["node" , "dist/index.js"]


# docker build -t node_backend .   (This command to build a Image)
# docker run -e NAME=deepanshu -p 3000:3000 node_backend  (This command to run the Image)


#Image is made up of multiple layers. Each layer is stacked on top of the previous layer. 
#The first layer is the base image, and each subsequent layer adds functionality to the image.

#Layers are cashed ans reused when possible. This means that if you make changes to a layer, the changes will not be applied to the base layer.

#if you make a change to the 3rd layer and build the image again, all the layers above it will be we reused and all the layers below it will build

#Layers stack on top of each other to create a single image. Each layer is a snapshot of the application at a specific point in time.


# Now in this docker file if packeage.json and package-lock.json files are changed then RUN npm install command is [Cached] same for prisma


#volumes are used to persist data between containers reloads. They are created using the docker volume create command and can be mounted to containers using the -v option.

#docker volume create my-volume
#docker run -v my-volume:/data/db -p 27017:27017 mongo
#docker volume ls
#docker volume rm my-volume


#networks are used to create logical boundaries for communication between containers. They can be used to isolate containers and provide a way to connect them together.

# docker network create my-network
# docker run -d -v my-volume:/data/db --name mongoDB --network my-network -p 27017:27017 mongo         MongodbContainer
# docker run -d -p 3000:3000 --name nodeBackend --network my-network node_backend                      Your node application container
# docker network ls
# docker network rm my-network


# docker logs <container_id>   to check the logs of a container