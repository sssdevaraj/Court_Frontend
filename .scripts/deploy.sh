# #!/bin/bash
# set -e

# echo "🚀 Deployment started..."

# # Ensure we are on main branch and up to date
# echo "📥 Fetching latest changes..."
# git fetch origin
# git checkout -B main origin/main
# git pull origin main

# echo "✅ New changes copied to server!"

# # Install dependencies (production only for speed/cleanliness)
# echo "📦 Installing Dependencies..."
# npm install

# # Create production build
# echo "🏗️ Creating Production Build..."
# npm run build

# echo "🎉 Deployment Finished!"
#!/bin/bash
set -e

echo "🚀 Deployment started..."

# Ensure we are on main branch and up to date
echo "📥 Fetching latest changes..."
git fetch origin
git checkout -B main origin/main
git reset --hard origin/main
git clean -fd
git pull origin main

echo "✅ New changes copied to server!"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Create production build
echo "🏗️ Creating Production Build..."
npm run build

# Copy build to public_html (for Vite/React)
echo "📤 Copying build to public_html..."
rm -rf ~/public_html/*
cp -r dist/* ~/public_html/

# Restart PM2 process
echo "🔄 Restarting PM2 process..."
pm2 restart my-app-name || pm2 start npm --name "my-app-name" -- run start

echo "🎉 Deployment Finished!"
