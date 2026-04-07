-- ============================================================
-- FINANCIAL AUDIT ANALYSIS - SQL QUERIES
-- Database: PostgreSQL | Schema: public | Table: audit_results
-- ============================================================


-- 1. TOTAL POPULATION VALUE
--    Target: 368.97T
SELECT SUM(amount) AS total_population_value
FROM public.audit_results;


-- 2. TOTAL TRANSAKSI KESELURUHAN
--    Target: 1,000,000
SELECT COUNT(*) AS total_transaksi
FROM public.audit_results;


-- 3. HIGH-RISK AMOUNT (risk_score >= 0.8)
--    Target: 89.65T
SELECT SUM(amount) AS high_risk_amount
FROM public.audit_results
WHERE risk_score >= 0.8;


-- 4. % RISK EXPOSURE
--    Target: 24.30%
SELECT 
    ROUND(
        COUNT(*) FILTER (WHERE risk_score >= 0.8) * 100.0 / COUNT(*), 2
    ) AS pct_risk_exposure
FROM public.audit_results;


-- 5. PROPORSI ANOMALI VS NORMAL
--    Target: Anomali 39.1T (10.6%) | Normal 329.87T (89.4%)
SELECT 
    is_anomaly,
    COUNT(*) AS jumlah_transaksi,
    SUM(amount) AS total_nilai,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS pct_jumlah,
    ROUND(SUM(amount) * 100.0 / SUM(SUM(amount)) OVER (), 1) AS pct_nilai
FROM public.audit_results
GROUP BY is_anomaly;


-- 6. INDIKASI TRANSAKSI DUPLIKAT - CV INTEGRA MANDIRI SEJAHTERA
--    Target: Rp 3,601,869,325,071.90
SELECT SUM(amount) AS total_duplikat
FROM public.audit_results
WHERE vendor_name = 'CV INTEGRA MANDIRI SEJAHTERA'
AND risk_score = 1.00;


-- 7. TOTAL TRANSAKSI PER VENDOR (TOP 5) BY AMOUNT
SELECT 
    vendor_name, 
    COUNT(*) AS jumlah_transaksi,
    SUM(amount) AS total_amount
FROM public.audit_results
GROUP BY vendor_name
ORDER BY total_amount DESC
LIMIT 5;


-- 8. CEK STRUKTUR TABEL
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'audit_results'
ORDER BY ordinal_position;
