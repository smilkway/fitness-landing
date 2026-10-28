# AURA PRIVATE FITNESS CLUB | Landing Page & CRM

최고급 프리미엄 피트니스 클럽 신규 회원의 1회 무료 체험 및 상담 신청을 유도하기 위한 하이엔드 모던 헬스장 랜딩페이지와 실시간 상담 신청 관리자 포털(CRM)입니다.

![AURA Fitness Club](https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=1200&q=80)

---

## 🏛️ 주요 페이지 구성

### 1. [랜딩페이지 (index.html)](index.html)
- **다크 럭셔리 & 네온 액센트 UI**: 딥 블랙 & 슬레이트 배경, 형광 네온 라임(`#84cc16`) & 일렉트릭 블루(`#06b6d4`)
- **Pretendard 웹폰트** 기반 고해상도 가독성
- **핵심 섹션**:
  - 메인 히어로 섹션 + 눈에 띄는 CTA (`1회 무료 체험 신청`)
  - 3대 시그니처 특장점 카드 (명품 머신 풀라인업, 1:1 3D 체형분석, 1인 프라이빗 샤워룸)
  - 마스터 코치 2인 프로필 (강태양 마스터, 서아인 수석 코치)
  - 실제 VIP 회원 리뷰 및 소셜 프루프
  - 실시간 상담 예약 신청 폼 (이름, 연락처 자동 하이픈, 희망일시, 운동 목적)

### 2. [관리자 대시보드 (admin.html)](admin.html)
- **홈페이지 실시간 연동**: 랜딩페이지에서 신청된 상담 건이 `localStorage`를 통해 즉시 관리자 대시보드에 실시간 반영
- **실시간 KPI 통계 카드**: 누적 신청 건수, 상담 대기(미처리), 방문 예약 확정, 상담 및 등록 완료 수치 집계
- **데이터 필터 & 실시간 검색**: 고객 성함, 연락처, 메모 실시간 검색 및 진행 상태/운동 목적별 필터링
- **원클릭 상태 변경**: 드롭다운을 통해 `대기중` ➔ `예약확정` ➔ `상담완료` ➔ `취소`로 즉시 상태 변경
- **상세 보기 및 매니저 메모 기능**: 고객의 세부 요청 및 담당 코치 배정 메모 기록
- **수기 상담 등록**: 전화 또는 방문 상담 건을 관리자가 즉시 직접 등록
- **엑셀(CSV) 다운로드**: 한글 깨짐 없는(UTF-8 BOM) 엑셀 호환 CSV 데이터 추출

---

## 🚀 실행 및 배포 링크

- **공식 웹사이트**: [https://smilkway.github.io/fitness-landing/](https://smilkway.github.io/fitness-landing/)
- **관리자 포털**: [https://smilkway.github.io/fitness-landing/admin.html](https://smilkway.github.io/fitness-landing/admin.html)
- **GitHub 저장소**: [https://github.com/smilkway/fitness-landing](https://github.com/smilkway/fitness-landing)
