#!/bin/bash

echo "Starting deployment..."

sudo /usr/bin/cp /home/sara/devops-ssh-project/index.html /var/www/html/index.html

sudo /usr/bin/systemctl reload nginx

echo "Deployment completed successfully!"

