#!/bin/bash

echo "Installing ..."

mkdir ~/floating-action-bar || echo "..."


cp -r bundle/* ~/floating-action-bar
cp -r .config ~/floating-action-bar/.config/

sudo cp floating-action-bar /usr/bin/floating-action-bar

sudo chmod 777 /usr/bin/floating-action-bar

echo "Installation Completed!"
