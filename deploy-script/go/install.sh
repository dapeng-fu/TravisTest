#!/bin/sh
#

echo "install go 1.5.1"
curl -o go.tar.gz -sL https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go.tar.gz
sudo chmod a+w /usr/local/go/src/