
# set -e

# echo "🚀 Deployment started..."

# # Ensure we are on main branch and up to date
# echo "📥 Fetching latest changes..."
# git fetch origin
# git checkout -B main origin/main
# git reset --hard origin/main
# git clean -fd
# git pull origin main

# echo "✅ New changes copied to server!"

# # Install dependencies
# echo "📦 Installing dependencies..."
# npm install

# # Create production build
# echo "🏗️ Creating Production Build..."
# npm run build

# # Copy build to public_html (for Vite/React)
# echo "📤 Copying build to public_html..."
# rm -rf ~/public_html/*
# cp -r dist/* ~/public_html/

# # Restart PM2 process
# echo "🔄 Restarting PM2 process..."
# pm2 restart my-app-name || pm2 start npm --name "my-app-name" -- run start

# echo "🎉 Deployment Finished!"
#!/bin/bash

echo "🚀 Deployment started..."

APP_DIR="/home/ecourtmsg/htdocs/court_front"
DEPLOY_DIR="/home/ecourtmsg/public_html"

# If repo not cloned, clone it
if [ ! -d "$APP_DIR/.git" ]; then
  echo "📥 Cloning repository..."
  git clone -b main git@github.com:YOUR_GITHUB_USERNAME/YOUR_REPO_NAME.git $APP_DIR
else
  echo "📥 Pulling latest changes..."
  cd $APP_DIR
  git fetch origin
  git reset --hard origin/main
  git clean -fd
  git pull origin main
fi

cd $APP_DIR

# Install dependencies
echo "📦 Installing dependencies..."
npm install --legacy-peer-deps

# Build
echo "🏗️ Building project..."
npm run build

# Deploy build files to public folder
echo "📤 Deploying to $DEPLOY_DIR..."
rm -rf $DEPLOY_DIR/*
cp -r dist/* $DEPLOY_DIR/

echo "🎉 Deployment Finished!"
