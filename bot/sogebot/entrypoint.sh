#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

echo "-------------------------------------------------------------"
echo "Update npm to latest and update node packages. Please wait..."
echo "-------------------------------------------------------------"
npm install -g npm@latest; npm cache clean --force; npm update; npm install

# Print Node.js Version
echo "Installed Node Version:"
node -v
echo "Installed NPM Version:"
npm -v

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
