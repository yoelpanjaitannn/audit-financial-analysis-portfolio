# 🔍 Financial Audit Analysis — 1M Transactions Population Audit

## 📌 Project Overview
Proyek ini mensimulasikan audit keuangan berbasis **populasi penuh** terhadap **1.000.000 transaksi** senilai **Rp 368,97 Triliun** menggunakan pendekatan data analitik modern.

Berbeda dengan audit sampling konvensional, metode ini memungkinkan deteksi anomali secara menyeluruh tanpa risiko missed findings pada transaksi material.

---

## 📊 Dashboard Summary

| Metrik | Nilai |
|---|---|
| Total Population Value | Rp 368,97 T |
| Total Transaksi | 1.000.000 |
| High-Risk Amount | Rp 89,65 T |
| % Risk Exposure | 24,30% |
| Anomaly Value | Rp 39,1 T (10,6%) |
| Indikasi Duplikat (CV INTEGRA) | Rp 3,601,869,325,071.90 |

---

## 🚨 Key Finding — Indikasi Transaksi Duplikat

Teridentifikasi **9.762 transaksi** dengan nilai identik **Rp 368.968.379,95** pada vendor **CV INTEGRA MANDIRI SEJAHTERA** dengan `risk_score = 1.00`, menghasilkan total exposure sebesar **Rp 3,60 Triliun**.

Temuan ini diverifikasi langsung melalui SQL query di PostgreSQL.

---

## 🛠️ Tools & Stack

| Tool | Fungsi |
|---|---|
| Python (Pandas, NumPy) | Data generation & preprocessing |
| PostgreSQL + DBeaver | Database & SQL forensic query |
| Power BI | Dashboard & visualisasi |
| GitHub | Version control & portofolio |

---

## 📁 File Structure

```
audit-financial-analysis-portfolio/
├── final_audited_data.xlsx        # Dataset 1 juta transaksi (synthetic)
├── Audit_Financial_FY2026.pbix    # Power BI dashboard file
├── audit_queries.sql              # SQL queries untuk forensic analysis
├── screenshot_dashboard.png       # Power BI dashboard preview
└── screenshot_dbeaver.png         # DBeaver SQL query result
```

---

## 🔎 SQL Forensic Query

```sql
-- Deteksi indikasi duplikat — CV INTEGRA MANDIRI SEJAHTERA
SELECT SUM(amount) AS total_duplikat
FROM public.audit_results
WHERE vendor_name = 'CV INTEGRA MANDIRI SEJAHTERA'
AND risk_score = 1.00;

-- Result: 3,601,869,325,071.90
```

---

## 📷 Preview

### Power BI Dashboard
![Dashboard](untuk_up_linkedin_cek_dulu.png)

### DBeaver SQL Result
![DBeaver](untuk_upload_linkedin_besok_cek_dulu.png)

---

## 👤 About
**Yoel William Panjaitan**
Finance & Data Analyst | AR/AP | PostgreSQL | Power BI | Python

🔗 [LinkedIn](https://www.linkedin.com/in/yoel-william-panjaitan-218457286)
📁 [GitHub](https://github.com/yoelpanjaitannn)

---

> ⚠️ *Dataset yang digunakan adalah data sintetis (fiktif) yang dibuat untuk keperluan portofolio. Tidak ada data perusahaan nyata yang digunakan.*
