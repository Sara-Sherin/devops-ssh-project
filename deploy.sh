#!/bin/bash

echo "Starting deployment..."

sudo cp index.html /var/www/html/index.html

sudo systemctl reload nginx

echo "Deployment completed successfully!"
