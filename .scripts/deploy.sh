#!/bin/bash
set -e

echo "🚀 Deployment started..."

APP_DIR="/root/Court_Frontend"
WEB_DIR="/var/www/html"   # Nginx default root

cd $APP_DIR

echo "📥 Pulling latest code..."
git pull origin main
echo "✅ New changes copied to server!"

echo "📦 Installing dependencies..."
npm install --yes

echo "🏗️ Creating production build..."
npm run build

echo "📂 Deploying build to web directory..."
rm -rf $WEB_DIR/*
cp -r dist/* $WEB_DIR/

echo "✅ Deployment finished successfully!"
