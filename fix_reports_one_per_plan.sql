-- 1 plan = 1 laporan
-- 1) Hapus duplikat (sisakan yang paling lama)
delete from public.reports a
using public.reports b
where a.plan_id = b.plan_id
  and a.created_at > b.created_at;

delete from public.reports a
using public.reports b
where a.plan_id = b.plan_id
  and a.report_id > b.report_id;

-- 2) Constraint unik
create unique index if not exists reports_plan_unique on public.reports (plan_id);
