#!/bin/bash

# Get parameters from terraform
GITHUB_REPO_URL=${github_repo_url}
APP_PORT=${app_port}
APP_NAME=$(basename $GITHUB_REPO_URL)
NODE_VERSION=${node_version}

# Update system
sudo yum update -y

# Install NVM and Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install Node.js LTS
nvm install $NODE_VERSION
nvm use $NODE_VERSION

# Install Git
sudo yum install git -y

# Clone repository
cd /home/ec2-user
git clone $GITHUB_REPO_URL
cd $APP_NAME

# Install dependencies and build
npm i
npm run build

# Install PM2 globally
npm install -g pm2

# Start application with PM2
pm2 start npm --name "$APP_NAME" -- start

# Set PM2 to start on system boot
pm2 save
PM2_STARTUP_CMD=$(pm2 startup | grep "sudo env")
eval "sudo $PM2_STARTUP_CMD"

# Install and configure Nginx
sudo yum install nginx -y

# Configure Nginx
cat > /tmp/nextjs.conf << EOF
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://localhost:$APP_PORT;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

sudo mv /tmp/nextjs.conf /etc/nginx/conf.d/nextjs.conf

# Test Nginx configuration
sudo nginx -t

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx