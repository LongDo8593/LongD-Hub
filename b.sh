#!/bin/bash


DOWNLOAD_PATH="/sdcard/Download"
mkdir -p $DOWNLOAD_PATH
cd $DOWNLOAD_PATH

echo "--- 🚀 BẮT ĐẦU QUÁ TRÌNH AUTO ---"

LINKS=(
    "https://download1592.mediafire.com/ei7pabzwq8mg8Suc94xolhQbigv9q74khozS4MeI-Dkf1S5AJ1cQiBamRgyZbw-6IyXZ83uYtxqMiVXyjxAt1EmlclEVQ4JnP7dMv1Qxg2aKnT-UdeJ-vbxMgFAvkaI3NIuFHbFihGkHDqCEKG78ypU700df28fScfQ5M7GRR0U/r5ok8xuzaa4167p/DeltaQTLiteSamehwidCloneVIP%28ZM%29+01-2.711.876.apk_clone.apk"
    "https://download844.mediafire.com/wdo8mrn4i6agpMCaNA_1yxrFBdiuhK-IEDEPro1Km2hdwplGqqr9b-FBA5lSTOPkQy4fVDwPRA_NZDbJytZR6ZcxFoAashJp8_U3F1fO5k6NjXXG96PrynDtQBRrnP3KuaNQ2Xmb03Zxb4v1rW6Z0Uas-HTatm5KqDMy1U5NsBw/rr636jfea0eg53w/DeltaQTLiteSamehwidCloneVIP%28ZM%29+02-2.711.876.apk_clone.apk"
    "https://download1475.mediafire.com/sk373wz8fymgvN7Y5YfQVjhZBmMtVeHquMfSu0MndPU_o6ZFcwEnm_Z0OGZPLZUnY_2Za-39bguSp6Y6Be_nVjGmPXY_4nQ2gvn0TOGx8R3JHnVObFm-dDFM1l0ZEc1Je8yFvsh12l-tAHcOlsOrBdCx-tU3-kh0e44lMl_3pg4/3h74u8hxskd4d41/DeltaQTLiteSamehwidCloneVIP%28ZM%29+03-2.711.876.apk_clone.apk"
    "https://download1349.mediafire.com/q0gconk56uhgLKn65GveWZIipMsDx9sXdgV8_NKqQi_k8e2kWDy99HSROKsR7TBUO7xWgGodfbNH_JlSB0VxIpdBEFyu6S-RYz8vVyhsKmyqJtyYW7VxGqxDQUfJVXlvUhGGMtK2mefJO_1zk0eUILnYjleiUZb4nsMlek7Ile8/2bwbngf63fe4d0e/DeltaQTLiteSamehwidCloneVIP%28ZM%29+04-2.711.876.apk_clone.apk"
    "https://download2347.mediafire.com/vi25w6qfa24g__vZedgKTQTKZrBbxlTxia6gFa4SrTZMjLD4BHSpU6e1xH7hE3QW_GvI1W1QDIDm_EpO-QxqtkOkVqDkc5LxVwXPdb2r3-U2wBekMxgOpCJEwVgK6M139kSxMOAypFZgHu8osTe0lHquwyuQvRyn4VI4Ki7owKo/0hc08nzxk1h73q0/ZArchiver_1.0.10_APKPure.apk"
    "https://download1638.mediafire.com/j7nfl2ilh6xgZkgRt_wi41jCTid9CMf6wligbDpFJ6C8RprCqfAO98sjiv_xyidtCwtxENYqgGIJdB-_tlGzMe9jJObeiAyEFTeLbpS6V1uuh4WbXMOiNVIIz-toopaqN8mQV67ZRoZtjzx2C_-fmPiTZ1oSAWvEH_WDgx8Lcx4/h91dn644ycyp9n1/helper.apk"
    "https://download1085.mediafire.com/97reyhifcmngLjbzNkPgoYUJP_uiXRkLjZkqPFjcnJJMqPETW7zoL2Llr73SpYV-r1ssDE4WukWrsW-Kacld8QPLxHdjxzAzhZqbRM65-Vs826JIrweFoVZk6MmtF22u0ZBCIpSpcznd8aomZNB36rBsD43tdIEHU8-pUqL_v4Q/brin8zj0eq82i96/MCP_v26.01.14_00_25+%281%29.apk"
)


for url in "${LINKS[@]}"; do
    filename=$(basename "$url")
    

    echo "[*] Đang tải: $filename..."
    curl -L -o "$filename" "$url"
    
    
    if [ -f "$filename" ]; then
        echo "[+] Đang cài đặt: $filename..."
        su -c "pm install -r $filename"
    else
        echo "❌ Lỗi: Không tải được $filename"
    fi
done

echo "--- ✅ ĐÃ CÀI XONG TẤT CẢ APK! ---"


echo "[*] Đang lấy script setup từ GitHub..."
curl https://raw.githubusercontent.com/zam2109/Toolrejoin/refs/heads/main/Setubtoolrejoin | bash

echo "--- ⚡ ĐANG KHỞI CHẠY TOOL REJOIN... ---"


su -c "export PATH=$PATH:/data/data/com.termux/files/usr/bin && export TERM=xterm-256color && cd /sdcard/Download && python zamtoolrejoinver10.py"
