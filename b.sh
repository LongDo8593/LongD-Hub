#!/data/data/com.termux/files/usr/bin/bash

DOWNLOAD_PATH="/sdcard/Download"

mkdir -p "$DOWNLOAD_PATH"
cd "$DOWNLOAD_PATH" || exit

echo "🚀 START AUTO"

# 👉 LINK MEDIAFIRE GỐC (bạn đưa)
PAGES=(
"https://www.mediafire.com/file/r5ok8xuzaa4167p/DeltaQTLiteSamehwidCloneVIP%2528ZM%2529_01-2.711.876.apk_clone.apk/file"
"https://www.mediafire.com/file/rr636jfea0eg53w/DeltaQTLiteSamehwidCloneVIP%2528ZM%2529_02-2.711.876.apk_clone.apk/file"
"https://www.mediafire.com/file/3h74u8hxskd4d41/DeltaQTLiteSamehwidCloneVIP%2528ZM%2529_03-2.711.876.apk_clone.apk/file"
"https://www.mediafire.com/file/2bwbngf63fe4d0e/DeltaQTLiteSamehwidCloneVIP%2528ZM%2529_04-2.711.876.apk_clone.apk/file"
"https://www.mediafire.com/file/0hc08nzxk1h73q0/ZArchiver_1.0.10_APKPure.apk/file"
"https://www.mediafire.com/file/brin8zj0eq82i96/MCP_v26.01.14_00_25_%25281%2529.apk/file"
"https://www.mediafire.com/file/h91dn644ycyp9n1/helper.apk/file"
)
# install tool nếu thiếu
pkg install curl grep sed coreutils -y >/dev/null 2>&1

# 👉 function lấy link thật (improved)
get_real_link() {
    curl -L -s "$1" \
    | grep -o 'https://download[^"]*' \
    | sed 's/&amp;/\&/g' \
    | head -n 1
}

# download + check + install
for page in "${PAGES[@]}"; do
    echo "🔍 Processing..."

    real_url=$(get_real_link "$page")

    if [ -z "$real_url" ]; then
        echo "❌ Không lấy được link"
        continue
    fi

    filename=$(basename "$real_url")

    echo "⬇️ $filename"
    curl -L --fail --retry 3 -o "$filename" "$real_url"

    if [ ! -f "$filename" ]; then
        echo "❌ Download fail"
        continue
    fi

    size=$(stat -c%s "$filename" 2>/dev/null || stat -f%z "$filename")

    # 👉 check file thật (MediaFire file luôn lớn)
    if [ "$size" -lt 1000000 ]; then
        echo "❌ File lỗi ($size bytes)"
        rm -f "$filename"
        continue
    fi

    echo "✅ OK ($size bytes)"

    # install nếu có root
    if command -v su >/dev/null 2>&1; then
        echo "📦 Install $filename"
        su -c "pm install -r '$DOWNLOAD_PATH/$filename'"
    else
        echo "⚠️ No root -> skip install"
    fi
done

echo "✅ DONE APK"

# load tool (giữ nguyên theo bạn)
curl -L https://raw.githubusercontent.com/zam2109/Toolrejoin/refs/heads/main/Setubtoolrejoin | bash

# run tool
if command -v su >/dev/null 2>&1; then
    su -c "cd /sdcard/Download && python zamtoolrejoinver10.py"
else
    cd /sdcard/Download
    python zamtoolrejoinver10.py
fi

echo "🔥 DONE"
