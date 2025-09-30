#!/bin/bash
set -e

echo "🚀 Deployment started..."

# Ensure we are on main branch and up to date
echo "📥 Fetching latest changes..."
git fetch origin
git checkout -B main origin/main
git pull origin main

echo "✅ New changes copied to server!"

# Install dependencies (production only for speed/cleanliness)
echo "📦 Installing Dependencies..."
npm install

# Create production build
echo "🏗️ Creating Production Build..."
npm run build

echo "🎉 Deployment Finished!"
