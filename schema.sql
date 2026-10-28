-- ========================================================
-- AURA 피트니스 클럽 Supabase 데이터베이스 테이블 스키마
-- Supabase 대시보드 -> SQL Editor 메뉴에 붙여넣고 [Run]을 누르세요.
-- ========================================================

-- 1. 상담 신청 테이블 생성
CREATE TABLE IF NOT EXISTS public.reservations (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  phone TEXT NOT NULL,
  date TEXT NOT NULL,
  goal TEXT DEFAULT '1:1 VIP 맞춤 PT',
  memo TEXT DEFAULT '',
  status TEXT DEFAULT '대기중',
  created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Row Level Security(RLS) 활성화
ALTER TABLE public.reservations ENABLE ROW LEVEL SECURITY;

-- 3. 웹사이트 방문자 및 관리자 CRUD 허용 정책 (익명 API 키 기준)
DROP POLICY IF EXISTS "Allow anon insert" ON public.reservations;
CREATE POLICY "Allow anon insert" ON public.reservations
  FOR INSERT TO anon WITH CHECK (true);

DROP POLICY IF EXISTS "Allow anon select" ON public.reservations;
CREATE POLICY "Allow anon select" ON public.reservations
  FOR SELECT TO anon USING (true);

DROP POLICY IF EXISTS "Allow anon update" ON public.reservations;
CREATE POLICY "Allow anon update" ON public.reservations
  FOR UPDATE TO anon USING (true);

DROP POLICY IF EXISTS "Allow anon delete" ON public.reservations;
CREATE POLICY "Allow anon delete" ON public.reservations
  FOR DELETE TO anon USING (true);

-- 4. 실시간(Realtime) 변경 감지 활성화
ALTER PUBLICATION supabase_realtime ADD TABLE public.reservations;

-- 5. 샘플 데이터 입력 (선택 사항)
INSERT INTO public.reservations (id, name, phone, date, goal, memo, status)
VALUES
  ('RES-1730001', '최민석', '010-3849-1120', '2026-10-29 15:00', '1:1 VIP 맞춤 PT', '강태양 마스터 코치님 3대 운동 및 스트렝스 상담 희망합니다.', '대기중'),
  ('RES-1730002', '정유라', '010-9281-4432', '2026-10-30 11:30', '체형 교정 및 재활', '골반 불균형 및 허리 디스크 이력 있음. 서아인 코치님 배정 요청.', '상담완료'),
  ('RES-1730003', '박진형', '010-5542-8871', '2026-10-30 19:00', '근력 강화 및 바디프로필', '3개월 단기 바디프로필 촬영 준비 중입니다. 식단 가이드 필요.', '예약확정'),
  ('RES-1730004', '송하은', '010-7731-9920', '2026-11-01 14:00', '프라이빗 헬스 멤버십', '조용한 프라이빗 헬스장 찾고 있습니다. 시설 투어 희망.', '대기중')
ON CONFLICT (id) DO NOTHING;
