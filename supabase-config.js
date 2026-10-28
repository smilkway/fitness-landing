/**
 * AURA 피트니스 클럽 Supabase 연동 모듈
 * 로컬스토리지와 Supabase 클라우드 데이터베이스를 모두 지원하는 하이브리드 연동
 */

const SUPABASE_STORAGE_URL_KEY = 'aura_supabase_url';
const SUPABASE_STORAGE_ANON_KEY = 'aura_supabase_key';

let _supabaseClient = null;

// Supabase 클라이언트 초기화 함수
function initAuraSupabase() {
  const url = localStorage.getItem(SUPABASE_STORAGE_URL_KEY);
  const key = localStorage.getItem(SUPABASE_STORAGE_ANON_KEY);

  if (url && key && window.supabase && window.supabase.createClient) {
    try {
      _supabaseClient = window.supabase.createClient(url.trim(), key.trim());
      return _supabaseClient;
    } catch (e) {
      console.warn('[AURA CRM] Supabase 클라이언트 생성 실패:', e);
      _supabaseClient = null;
      return null;
    }
  }
  _supabaseClient = null;
  return null;
}

// 연동 여부 확인
function isSupabaseConnected() {
  return initAuraSupabase() !== null;
}

// 클라이언트 가져오기
function getAuraSupabase() {
  if (!_supabaseClient) {
    initAuraSupabase();
  }
  return _supabaseClient;
}

// 설정 저장
function setSupabaseConfig(url, key) {
  if (!url || !key) {
    throw new Error('Supabase URL과 Anon Key를 모두 입력해주세요.');
  }
  localStorage.setItem(SUPABASE_STORAGE_URL_KEY, url.trim());
  localStorage.setItem(SUPABASE_STORAGE_ANON_KEY, key.trim());
  return initAuraSupabase();
}

// 설정 제거 (로컬 모드로 전환)
function clearSupabaseConfig() {
  localStorage.removeItem(SUPABASE_STORAGE_URL_KEY);
  localStorage.removeItem(SUPABASE_STORAGE_ANON_KEY);
  _supabaseClient = null;
}

// 연결 테스트
async function testSupabaseConnection(url, key) {
  if (!window.supabase || !window.supabase.createClient) {
    throw new Error('Supabase JS 라이브러리가 로드되지 않았습니다.');
  }
  const testClient = window.supabase.createClient(url.trim(), key.trim());
  const { data, error } = await testClient.from('reservations').select('id').limit(1);
  if (error) {
    throw error;
  }
  return true;
}

// 전역 등록
window.AuraSupabase = {
  init: initAuraSupabase,
  isConnected: isSupabaseConnected,
  getClient: getAuraSupabase,
  setConfig: setSupabaseConfig,
  clearConfig: clearSupabaseConfig,
  testConnection: testSupabaseConnection,
  getUrl: () => localStorage.getItem(SUPABASE_STORAGE_URL_KEY) || '',
  getKey: () => localStorage.getItem(SUPABASE_STORAGE_ANON_KEY) || ''
};

// 페이지 로드 시 자동 초기화
document.addEventListener('DOMContentLoaded', () => {
  initAuraSupabase();
});
