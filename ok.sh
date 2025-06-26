#!/bin/bash

set -e

echo "🔧 Cài đặt MongoDB 8.0 trên Ubuntu 24.04..."

# Cài các gói cần thiết
sudo apt update
sudo apt install -y curl gnupg

# Thêm MongoDB public GPG key
echo "📦 Thêm khóa xác thực MongoDB..."
curl -fsSL https://pgp.mongodb.com/server-8.0.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-8.0.gpg

# Thêm repo MongoDB (dùng repo của Ubuntu 22.04 - jammy)
echo "📦 Thêm repo MongoDB..."
echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg arch=amd64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

# Cập nhật APT và cài MongoDB
echo "🚀 Cài MongoDB..."
sudo apt update
sudo apt install -y mongodb-org

# Khởi động MongoDB và bật khởi động cùng hệ thống
echo "✅ Khởi động MongoDB..."
sudo systemctl start mongod
sudo systemctl enable mongod

# Kiểm tra trạng thái
echo "📈 Trạng thái MongoDB:"
sudo systemctl status mongod --no-pager

echo "🎉 MongoDB đã chạy tại: mongodb://localhost:27017"
