# 🚀 Ubuntu Remote Support Tool (v3.0)
เครื่องมือติดตั้งและตั้งค่า Remote SSH สำหรับ Ubuntu แบบอัตโนมัติ พร้อมหน้าจอ GUI สวยงาม

## ✨ คุณสมบัติ (Features)
- ✅ **One-Click Setup:** ติดตั้ง OpenSSH Server และตั้งค่า Firewall ให้อัตโนมัติ
- 🛡️ **Security First:** มีระบบตรวจสอบรหัสผ่าน (Sudo) ก่อนเริ่มทำงาน
- 🌐 **Network Check:** ตรวจสอบการเชื่อมต่ออินเทอร์เน็ตก่อนเริ่มติดตั้ง
- 📊 **Status Summary:** แสดงเลข IP, Username และทดสอบสถานะการเชื่อมต่อ (SSH Test) ทันทีที่เสร็จ

## 📥 วิธีใช้งานสำหรับลูกค้า (How to use)
1. **ดาวน์โหลดสคริปต์:** ดาวน์โหลดไฟล์ `setup.sh` จากลิงก์ที่คุณได้รับ
2. **เปิดสิทธิ์การรัน (Permission):**
   - คลิกขวาที่ไฟล์ `setup.sh` -> เลือก **Properties**
   - ไปที่แถบ **Permissions** -> ติ๊กถูกที่ **"Executable as Program"**
3. **เริ่มทำงาน:**
   - คลิกขวาที่ไฟล์ -> เลือก **"Run as Program"**
   - กรอกรหัสผ่านเครื่อง Ubuntu และรอจนกว่าจะเสร็จสิ้น

## 👨‍💻 สำหรับ IT Support (How to Connect)
เมื่อรันเสร็จแล้ว ให้นำ **IP Address** และ **Username** ที่ปรากฏบนหน้าจอ ไปใช้ใน Windows ผ่าน PowerShell หรือ Terminal:
```bash
ssh username@ip-address