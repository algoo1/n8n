# دليل النشر التفصيلي على Railway 🚀

## الخطوة 1: إعداد GitHub

### 1.1 إنشاء مستودع جديد
```bash
git init
git add .
git commit -m "Initial commit: n8n Railway deployment"
git branch -M main
git remote add origin https://github.com/yourusername/n8n-railway-deployment.git
git push -u origin main
```

## الخطوة 2: إعداد Railway

### 2.1 إنشاء حساب
1. اذهب إلى [railway.app](https://railway.app)
2. اضغط "Login with GitHub"
3. وافق على الصلاحيات

### 2.2 إنشاء مشروع جديد
1. اضغط "New Project"
2. اختر "Deploy from GitHub repo"
3. اختر المستودع الذي أنشأته

### 2.3 إضافة قاعدة البيانات
1. في لوحة المشروع، اضغط "Add Service"
2. اختر "Database" → "PostgreSQL"
3. انتظر حتى يتم إنشاؤها (2-3 دقائق)

## الخطوة 3: تكوين متغيرات البيئة

### 3.1 الحصول على بيانات قاعدة البيانات
1. اضغط على خدمة PostgreSQL
2. اذهب إلى تبويب "Variables"
3. انسخ القيم التالية:
   - `PGHOST`
   - `PGPORT`
   - `PGDATABASE`
   - `PGUSER`
   - `PGPASSWORD`

### 3.2 تكوين خدمة n8n
1. اضغط على خدمة n8n
2. اذهب إلى تبويب "Variables"
3. أضف المتغيرات التالية:

```
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=YourSecurePassword123!
PORT=5678
N8N_PROTOCOL=https
NODE_ENV=production
DB_TYPE=postgresdb
```

### 3.3 ربط قاعدة البيانات
أضف متغيرات قاعدة البيانات (من الخطوة 3.1):
```
DB_POSTGRESDB_HOST=${{Postgres.PGHOST}}
DB_POSTGRESDB_PORT=${{Postgres.PGPORT}}
DB_POSTGRESDB_DATABASE=${{Postgres.PGDATABASE}}
DB_POSTGRESDB_USER=${{Postgres.PGUSER}}
DB_POSTGRESDB_PASSWORD=${{Postgres.PGPASSWORD}}
```

## الخطوة 4: النشر والتشغيل

### 4.1 إعادة النشر
1. اضغط "Deploy" في خدمة n8n
2. انتظر حتى يكتمل النشر (5-10 دقائق)

### 4.2 الحصول على الرابط
1. في خدمة n8n، اذهب إلى تبويب "Settings"
2. انسخ الرابط من "Public Domain"
3. الرابط سيكون مثل: `https://your-app.railway.app`

## الخطوة 5: الوصول لـ n8n

### 5.1 فتح التطبيق
1. افتح الرابط في المتصفح
2. ستظهر صفحة تسجيل الدخول

### 5.2 تسجيل الدخول
- **اسم المستخدم**: `admin`
- **كلمة المرور**: التي حددتها في المتغيرات

## استكشاف الأخطاء 🔧

### مشكلة: التطبيق لا يعمل
**الحل:**
1. تحقق من logs في Railway
2. تأكد من تشغيل قاعدة البيانات
3. تحقق من متغيرات البيئة

### مشكلة: لا يمكن الوصول للتطبيق
**الحل:**
1. تأكد من PORT=5678
2. تحقق من Public Domain
3. انتظر 5-10 دقائق للنشر

### مشكلة: خطأ في قاعدة البيانات
**الحل:**
1. تحقق من متغيرات قاعدة البيانات
2. تأكد من تشغيل PostgreSQL
3. أعد نشر التطبيق

## التكلفة والحدود 💰

### الخطة المجانية
- **5$ شهرياً مجاناً**
- **500 ساعة تشغيل**
- **100GB نقل بيانات**
- **1GB RAM**

### متى تحتاج للدفع؟
- إذا تجاوزت 5$ شهرياً
- عادة يحدث مع الاستخدام المكثف جداً

## نصائح للتوفير 💡

1. **استخدم Webhooks بدلاً من Polling**
2. **أوقف المهام غير المستخدمة**
3. **راقب الاستخدام في Railway Dashboard**

## الأمان 🔒

### كلمات المرور القوية
```
N8N_BASIC_AUTH_PASSWORD=MySecure2024Password!@#
```

### تفعيل HTTPS
- مفعل افتراضياً في Railway
- لا تحتاج إعداد إضافي

---

**نصيحة**: احفظ هذا الدليل للرجوع إليه لاحقاً!