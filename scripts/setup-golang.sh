#!/usr/bin/env bash
# https://github.com/pecke01/go_vagrant

GO_VERSION=1.4.2
echo 'Downloading go$GO_VERSION.linux-amd64.tar.gz'
curl --silent https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz > golang.tar.gz
echo 'Unpacking go language'
sudo tar -C /usr/local -xzf golang.tar.gz
echo 'Setting up correct env. variables'
echo "export GOPATH=/vagrant/" >> /home/vagrant/.bashrc
echo "export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin" >> /home/vagrant/.bashrc
