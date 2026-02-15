#!/bin/bash

# Hostinger Deployment Setup Script
# This script helps configure GitHub Actions for Hostinger deployment

set -e

echo "=================================="
echo "Hostinger Deployment Setup"
echo "=================================="
echo ""

# Check if required commands exist
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "Error: $1 is not installed"
        exit 1
    fi
}

check_command "git"
check_command "ssh-keygen"

# Step 1: Generate SSH Key
echo "Step 1: SSH Key Generation"
echo "=========================="
read -p "Enter SSH key name (default: hostinger_key): " SSH_KEY_NAME
SSH_KEY_NAME=${SSH_KEY_NAME:-hostinger_key}
SSH_KEY_PATH="$HOME/.ssh/$SSH_KEY_NAME"

if [ -f "$SSH_KEY_PATH" ]; then
    read -p "SSH key already exists. Use existing key? (y/n): " USE_EXISTING
    if [ "$USE_EXISTING" != "y" ]; then
        echo "Generating new SSH key..."
        ssh-keygen -t ed25519 -C "hostinger-deployment" -f "$SSH_KEY_PATH" -N ""
    fi
else
    echo "Generating new SSH key..."
    ssh-keygen -t ed25519 -C "hostinger-deployment" -f "$SSH_KEY_PATH" -N ""
fi

echo ""
echo "Public Key (add this to Hostinger):"
echo "===================================="
cat "$SSH_KEY_PATH.pub"
echo ""

# Step 2: Gather Hostinger Information
echo "Step 2: Hostinger Connection Details"
echo "====================================="
read -p "Enter Hostinger Host (IP or domain): " HOSTINGER_HOST
read -p "Enter Hostinger SSH User: " HOSTINGER_USER
read -p "Enter Deployment Path (e.g., /home/user/public_html): " DEPLOYMENT_PATH

# Step 3: Display GitHub Secrets to Add
echo ""
echo "Step 3: GitHub Secrets Configuration"
echo "====================================="
echo ""
echo "Add these secrets to your GitHub repository:"
echo "(Go to Settings → Secrets and variables → Actions)"
echo ""
echo "1. HOSTINGER_SSH_KEY:"
echo "   (Content from below)"
echo ""
cat "$SSH_KEY_PATH"
echo ""
echo "2. HOSTINGER_HOST: $HOSTINGER_HOST"
echo "3. HOSTINGER_USER: $HOSTINGER_USER"
echo "4. DEPLOYMENT_PATH: $DEPLOYMENT_PATH"
echo ""

# Step 4: Test SSH Connection
echo "Step 4: Testing SSH Connection"
echo "=============================="
read -p "Test SSH connection now? (y/n): " TEST_SSH
if [ "$TEST_SSH" = "y" ]; then
    echo "Attempting SSH connection..."
    if ssh -i "$SSH_KEY_PATH" -o ConnectTimeout=5 "$HOSTINGER_USER@$HOSTINGER_HOST" "echo 'SSH connection successful!'" 2>/dev/null; then
        echo "✓ SSH connection successful!"
    else
        echo "✗ SSH connection failed. Check credentials and ensure public key is added to Hostinger."
    fi
fi

echo ""
echo "=================================="
echo "Setup Complete!"
echo "=================================="
echo ""
echo "Next steps:"
echo "1. Add the GitHub Secrets listed above"
echo "2. Ensure git is initialized on Hostinger at $DEPLOYMENT_PATH"
echo "3. Push to main branch to trigger automatic deployment"
echo ""