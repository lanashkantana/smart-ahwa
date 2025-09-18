# ☕ Smart Ahwa Manager

تطبيق Flutter لإدارة مقهى (أهوة) ذكي — يساعدك في **إضافة الطلبات، متابعة حالتها، واستخراج تقارير حول المشروبات الأكثر مبيعاً**.

---

## 📱 صور من التطبيق
<img width="374" height="805" alt="1" src="https://github.com/user-attachments/assets/a3454a7d-7854-41b5-9567-7154c8d47f47" />

<img width="361" height="801" alt="2" src="https://github.com/user-attachments/assets/0ea8ebcf-3c49-4ce8-a8ae-c53374778cd7" />
<img width="352" height="792" alt="3" src="https://github.com/user-attachments/assets/da011a42-c594-48d9-801c-c0ea6dead755" />
<img width="369" height="811" alt="4" src="https://github.com/user-attachments/assets/d5d2e9eb-f3a7-4905-9f62-db0f621fb950" />
<img width="368" height="790" alt="5" src="https://github.com/user-attachments/assets/cdfaf1e0-95df-43ff-8635-78e035a719ac" />



---

## ✨ المميزات
- ➕ إضافة طلب جديد مع اختيار المشروب وإضافة ملاحظات خاصة.
- 📋 عرض الطلبات المعلقة مع إمكانية تحديدها كمكتملة.
- 📊 تقارير حول أكثر المشروبات مبيعاً.
- 🔢 عرض إجمالي عدد المشروبات المقدمة.

---

## 🛠️ التقنيات المستخدمة
- **Flutter** — لتطوير الواجهة.
- **Dart** — لبناء المنطق والخدمات.
- **Repository Pattern** — للفصل بين البيانات والمنطق.
- **In-Memory Repository** — للتجريب بدون قاعدة بيانات.

---

## 📂 هيكل المشروع
lib/
├─ main.dart
├─ models/
│  ├─ drink.dart
│  └─ order.dart
├─ services/
│  ├─ order_repository.dart
│  └─ in_memory_order_repository.dart
└─ controllers/
   └─ order_controller.dart
