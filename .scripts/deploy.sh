#!/bin/bash
set -e

echo "🚀 Deployment started..."

APP_DIR="/root/Court_Frontend"
WEB_DIR="/home/ecourtmsg/htdocs/court_front"

cd $APP_DIR

echo "📥 Pulling latest code..."
git pull origin main
echo "✅ New changes copied to server!"

echo "📦 Installing dependencies..."
npm install --yes

echo "🏗️ Creating production build..."
# For ReactJS / VueJS / Vite / Nuxt
npm run build
# For NextJS
# npm run export

echo "📂 Deploying build to web directory..."
rm -rf $WEB_DIR/*
cp -r dist/* $WEB_DIR/

echo "✅ Deployment finished successfully!"
