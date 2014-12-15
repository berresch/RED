#!/bin/bash

echo "Configuring Docker..."
cp -v /vagrant/provisioning/rc.local /etc/rc.local
cp -v /vagrant/provisioning/docker /etc/default/docker

echo "Installing pipework..."
wget -qO /usr/local/sbin/pipework https://raw.github.com/lukaspustina/pipework/master/pipework
chmod +x /usr/local/sbin/pipework
