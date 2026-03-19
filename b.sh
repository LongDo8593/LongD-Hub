#!/bin/bash

# 1. Cấu hình thư mục
DOWNLOAD_PATH="/sdcard/Download"
mkdir -p $DOWNLOAD_PATH
cd $DOWNLOAD_PATH

echo "--- 🚀 BẮT ĐẦU QUÁ TRÌNH AUTO ---"

# Danh sách link (Thay URL thật của ông vào đây)
LINKS=(
    "https://example.com/apk1.apk"
    "https://example.com/apk2.apk"
    "https://example.com/apk3.apk"
    "https://example.com/apk4.apk"
    "https://example.com/zarchiver.apk"
    "https://example.com/apk_them_1.apk"
    "https://example.com/apk_them_2.apk"
)

# 2. Vòng lặp Tải và Cài đặt
for url in "${LINKS[@]}"; do
    filename=$(basename "$url")
    
    # Tải file
    echo "[*] Đang tải: $filename..."
    curl -L -o "$filename" "$url"
    
    # Cài đặt file (Sử dụng quyền Root để cài ngầm)
    if [ -f "$filename" ]; then
        echo "[+] Đang cài đặt: $filename..."
        su -c "pm install -r $filename"
    else
        echo "❌ Lỗi: Không tải được $filename"
    fi
done

echo "--- ✅ ĐÃ CÀI XONG TẤT CẢ APK! ---"

# 3. Chạy lệnh setup từ GitHub
echo "[*] Đang lấy script setup từ GitHub..."
curl https://raw.githubusercontent.com/zam2109/Toolrejoin/refs/heads/main/Setubtoolrejoin | bash

echo "--- ⚡ ĐANG KHỞI CHẠY TOOL REJOIN... ---"

# 4. Lệnh khởi động Tool
su -c "export PATH=$PATH:/data/data/com.termux/files/usr/bin && export TERM=xterm-256color && cd /sdcard/Download && python zamtoolrejoinver10.py"
