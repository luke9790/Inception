#!/bin/bash
if [ ! -d "/home/${USER}/data" ]; then
        sudo mkdir ~/data
        sudo mkdir ~/data/mariadb
        sudo mkdir ~/data/wordpress
else
        echo "Directory already exists"
fi
