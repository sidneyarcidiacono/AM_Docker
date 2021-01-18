# We want to tell Docker to pull things from a container, either on our machine or DockerHub
FROM node

# Set the working directory, so that when we run commands, they're executed here.
WORKDIR /app

# We can optimize our build time slightly, knowing that this file rarely changes
COPY package.json /app

# We're going to need to run npm install like we would outside
# This will also run on a path relative to WORKDIR
RUN npm install

# We want to copy the files from this project folder into an /app folder in our container
# Since we set our working directory, this will run on a path relative to WORKDIR
# Here, we still set /app explicitly for readability, but we could also set ./
COPY . /app

# Tell our image to expose a port for running container locally
# (This doesn't really do anything. This is here for documentation purposes.)
# You should include this command as a best practice, but it doesn't do anything to the image.
EXPOSE 80

# The above commands run to create an image, but CMD tells the container
# what to run when it's created based on this image
# (This is why we don't make this another RUN command)
CMD ["node", "server.js"]
