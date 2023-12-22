#!/bin/bash
if [ ! -d "/home/${USER}/data" ]; then
    sudo mkdir -p ~/data/mariadb
    sudo mkdir -p ~/data/wordpress
else
    echo "Directory already exists"
fi