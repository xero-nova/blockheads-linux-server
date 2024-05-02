#!/bin/bash

# Create server directory and set permissions
mkdir $HOME/TheBlockheads || { echo "Failed to create TheBlockheads directory"; exit 1; }
cd $HOME/TheBlockheads || { echo "Failed to change directory to TheBlockheads"; exit 1; }
chown $USER:$USER $HOME/TheBlockheads || { echo "Failed to set ownership for TheBlockheads directory"; exit 1; }
chmod 755 $HOME/TheBlockheads || { echo "Failed to set permissions for TheBlockheads directory"; exit 1; }

# Install required packages
sudo apt-get install libgnustep-base1.28 -y || { echo "Failed to install libgnustep-base1.28"; exit 1; }
sudo apt-get install libdispatch0 -y || { echo "Failed to install libdispatch0"; exit 1; }
sudo apt-get install patchelf -y || { echo "Failed to install patchelf"; exit 1; }

# Download and extract Blockheads server
wget https://majicdave.com/share/blockheads_server171.tar.gz || { echo "Failed to download Blockheads server tarball"; exit 1; }
tar xzf blockheads_server171.tar.gz || { echo "Failed to extract Blockheads server tarball"; exit 1; }
chown $USER:$USER blockheads_server171 || { echo "Failed to set ownership for blockheads_server171"; exit 1; }
chmod 755 blockheads_server171 || { echo "Failed to set permissions for blockheads_server171"; exit 1; }

# Patch shared library dependencies
patchelf --replace-needed libgnustep-base.so.1.24 libgnustep-base.so.1.28 blockheads_server171 || { echo "Failed to patch libgnustep-base"; exit 1; }
patchelf --replace-needed libobjc.so.4.6 libobjc.so.4 blockheads_server171 || { echo "Failed to patch libobjc"; exit 1; }
patchelf --replace-needed libgnutls.so.26 libgnutls.so.30 blockheads_server171 || { echo "Failed to patch libgnutls"; exit 1; }
patchelf --replace-needed libgcrypt.so.11 libgcrypt.so.20 blockheads_server171 || { echo "Failed to patch libgcrypt"; exit 1; }
patchelf --replace-needed libffi.so.6 libffi.so.8 blockheads_server171 || { echo "Failed to patch libffi"; exit 1; }
patchelf --replace-needed libicui18n.so.48 libicui18n.so.70 blockheads_server171 || { echo "Failed to patch libicui18n"; exit 1; }
patchelf --replace-needed libicuuc.so.48 libicuuc.so.70 blockheads_server171 || { echo "Failed to patch libicuuc"; exit 1; }
patchelf --replace-needed libicudata.so.48 libicudata.so.70 blockheads_server171 || { echo "Failed to patch libicudata"; exit 1; }
patchelf --replace-needed libdispatch.so libdispatch.so.0 blockheads_server171 || { echo "Failed to patch libdispatch"; exit 1; }

# Download start.sh script
wget https://raw.githubusercontent.com/xero-nova/blockheads-linux-server/main/start.sh || { echo "Failed to download start.sh script"; exit 1; }
chown $USER:$USER start.sh || { echo "Failed to set ownership for start.sh"; exit 1; }
chmod 755 start.sh || { echo "Failed to set permissions for start.sh"; exit 1; }

echo "Setup completed successfully."
echo "TheBlockheads server directory is located at: $HOME/TheBlockheads"
echo "Before running start.sh use './blockheads_server171 -help' to create and configure a server then edit start.sh to match your server configuration."
