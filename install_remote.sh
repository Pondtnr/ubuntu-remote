#!/bin/bash

# ==========================================
# 🚀 IT SUPPORT REMOTE ACTIVATOR v3.0 (Final)
# ==========================================

# 1. เช็คการเชื่อมต่ออินเทอร์เน็ตก่อนเริ่ม
if ! ping -c 1 8.8.8.8 > /dev/null 2>&1; then
    zenity --error --title="⚠️ ไม่พบการเชื่อมต่อ" \
    --text="เครื่องนี้ไม่ได้เชื่อมต่ออินเทอร์เน็ต\nกรุณาเช็คสาย Lan หรือ Wi-Fi ก่อนดำเนินการครับ" --width=300
    exit
fi

# ฟังก์ชันเช็ครหัสผ่าน
check_password() {
    local pass=$1
    echo "$pass" | sudo -S true > /dev/null 2>&1
    return $?
}

# 2. Loop ถามรหัสผ่าน (จนกว่าจะถูก)
while true; do
    PASSWORD=$(zenity --password --title="🔒 ยืนยันตัวตน - IT Support" \
    --window-icon="network-transmit-receive" \
    --text="กรุณากรอกรหัสผ่านเครื่อง Ubuntu (Sudo Password)\nเพื่อเริ่มการติดตั้งระบบ Remote")

    if [ $? -ne 0 ] || [ -z "$PASSWORD" ]; then exit; fi

    if check_password "$PASSWORD"; then
        break
    else
        zenity --error --title="รหัสผ่านผิด" --text="รหัสผ่านไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง" --width=250
    fi
done

# 3. เริ่มดำเนินการ (Progress Bar)
(
echo "10" ; echo "# กำลังเตรียมความพร้อม..." ; sleep 1
echo "30" ; echo "# กำลังอัปเดตรายการแพ็คเกจ..."
echo "$PASSWORD" | sudo -S apt update -y > /dev/null 2>&1

echo "60" ; echo "# กำลังติดตั้งและเปิดใช้งาน OpenSSH..."
echo "$PASSWORD" | sudo -S apt install -y openssh-server > /dev/null 2>&1
echo "$PASSWORD" | sudo -S systemctl enable --now ssh > /dev/null 2>&1

echo "80" ; echo "# กำลังตั้งค่า Firewall (Allow Port 22)..."
echo "$PASSWORD" | sudo -S ufw allow 22/tcp > /dev/null 2>&1
echo "y" | echo "$PASSWORD" | sudo -S ufw enable > /dev/null 2>&1

echo "100" ; echo "# ตรวจสอบความเรียบร้อยสุดท้าย..." ; sleep 1
) | zenity --progress --title="⚙️ System Setup" --text="กำลังดำเนินการ..." --percentage=0 --auto-close

# 4. ดึงข้อมูลระบบ
IP=$(hostname -I | awk '{print $1}')
CURRENT_USER=$(whoami)

# ตรวจสอบ Port 22
if ss -tunlp | grep -q ":22"; then
    PORT_ST="<span foreground='green'><b>ACTIVE</b></span>"
else
    PORT_ST="<span foreground='red'><b>INACTIVE</b></span>"
fi

# ทดสอบ SSH Self-Test
if timeout 2s bash -c "true < /dev/tcp/127.0.0.1/22" 2>/dev/null; then
    SSH_ST="<span foreground='green'><b>PASSED</b></span>"
else
    SSH_ST="<span foreground='red'><b>FAILED</b></span>"
fi

# 5. หน้าต่างสรุปผล (Professional UI)
zenity --info --title="📊 IT Support: สรุปสถานะระบบ" \
--window-icon="network-transmit-receive" \
--text="<span foreground='#333' size='large'><b>ตั้งค่าการเข้าถึงระยะไกลสำเร็จ!</b></span>\n
━━━━━━━━━━━━━━━━━━━━━━━━━━
👤 <b>Username:</b>    <span foreground='#d33682'><b>$CURRENT_USER</b></span>
🌐 <b>IP Address:</b>   <span foreground='blue' size='x-large'><b>$IP</b></span>
🔌 <b>SSH Port:</b>      22 ($PORT_ST)
🚀 <b>SSH Test:</b>      $SSH_ST
━━━━━━━━━━━━━━━━━━━━━━━━━━\n
<b>วิธีใช้งานจาก Windows:</b>
1. เปิด PowerShell หรือ CMD
2. พิมพ์คำสั่ง: <span foreground='#228B22'>ssh $CURRENT_USER@$IP</span>
3. ใส่รหัสผ่านเครื่องนี้เพื่อเข้าคุมงาน" \
--width=480 --ok-label="รับทราบ"


