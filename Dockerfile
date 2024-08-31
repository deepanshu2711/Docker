#base image  layer1  Base layer is the first layer of the image. It contains the operating system and the base set of packages.
FROM node:18-alpine
#set working directory  Sets the working directory for any RUN, CMD, ENTRYPOINT, COPYinstructions that follow it.  Layer2
WORKDIR /app
#copy everything from the current directory to the working directory inside the container  Layer3
COPY . .

#install dependencies  Layer4
RUN npm install
#build the project  Layer5
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