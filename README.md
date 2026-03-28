# 🚀 Ubuntu Remote Support Tool (v3.0)
เครื่องมือติดตั้งและตั้งค่า Remote SSH สำหรับ Ubuntu แบบอัตโนมัติ พร้อมหน้าจอ GUI สวยงาม

## ✨ คุณสมบัติ (Features)
- ✅ **One-Click Setup:** ติดตั้ง OpenSSH Server และตั้งค่า Firewall ให้อัตโนมัติ
- 🛡️ **Security First:** มีระบบตรวจสอบรหัสผ่าน (Sudo) ก่อนเริ่มทำงาน
- 🌐 **Network Check:** ตรวจสอบการเชื่อมต่ออินเทอร์เน็ตก่อนเริ่มติดตั้ง
- 📊 **Status Summary:** แสดงเลข IP, Username และทดสอบสถานะการเชื่อมต่อ (SSH Test) ทันทีที่เสร็จ

## 🛠️ วิธีใช้งาน (Usage Guide)

เพื่อให้การ Support เป็นไปอย่างรวดเร็ว สามารถเลือกใช้งานได้ 2 รูปแบบดังนี้:

### พิมพ์คำสั่งใน Terminal 🚀
วิธีนี้ง่ายที่สุด **ไม่ต้องดาวน์โหลดไฟล์** และไม่ต้องตั้งค่าสิทธิ์ใดๆ เพียงก๊อปปี้คำสั่งด้านล่างนี้ไปวางใน Terminal:

1. กดปุ่ม `Ctrl + Alt + T` เพื่อเปิด Terminal
2. คัดลอกและวางคำสั่งนี้แล้วกด **Enter**:
    ```bash
    bash <(wget -qO- bit.ly/smlubuntuscript)

3. กรอกรหัสผ่านเครื่อง Ubuntu ของคุณ (ขณะพิมพ์จะมองไม่เห็นตัวเลข)
4. เมื่อรันเสร็จ แจ้งเลข IP Address และ Username ที่ปรากฏบนหน้าจอให้ทีม Support ทราบ

## แบบ Download ผ่าน github 📥
1. **ดาวน์โหลดสคริปต์:** ดาวน์โหลดไฟล์ `install_remote.sh` จาก
    ```bash
    https://github.com/Pondtnr/ubuntu-remote

2. **เปิดสิทธิ์การรัน (Permission):**
   - คลิกขวาที่ไฟล์ `install_remote.sh` -> เลือก **Properties**
   - ไปที่แถบ **Permissions** -> ติ๊กถูกที่ **"Executable as Program"**
3. **เริ่มทำงาน:**
   - คลิกขวาที่ไฟล์ -> เลือก **"Run as Program"**
   - กรอกรหัสผ่านเครื่อง Ubuntu และรอจนกว่าจะเสร็จสิ้น

## 👨‍💻 สำหรับ IT Support (How to Connect)
เมื่อรันเสร็จแล้ว ให้นำ **IP Address** และ **Username** ที่ปรากฏบนหน้าจอ ไปใช้ใน Windows ผ่าน PowerShell หรือ Terminal:
```bash
ssh username@ip-address