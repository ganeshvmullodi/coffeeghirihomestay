// ============================================================
//  Coffee Ghiri Homestay — Supabase connection
//  Loaded on public pages AND the admin panel.
//  Requires the supabase-js library to be loaded first:
//  <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2"></script>
// ============================================================

// Public project URL + PUBLISHABLE (anon) key.
// Safe to expose: Row-Level Security limits this key to public reads
// and only-you (authenticated) writes. Never put the secret key here.
const SB_URL = 'https://bdfllhlezjpjgoahjwjy.supabase.co';
const SB_KEY = 'sb_publishable_V41gkNh13aVAIiDdFtHBCw_5LaZZzAl';

// Single shared client for the whole site.
const sb = window.supabase.createClient(SB_URL, SB_KEY, {
  auth: { persistSession: true, autoRefreshToken: true }
});

// Public base URL for files in the "images" Storage bucket.
const SB_BUCKET = 'images';
function sbImage(path) {
  if (!path) return '';
  // Already a full URL or a local path? use as-is.
  if (/^https?:\/\//.test(path) || path.startsWith('images/') || path.startsWith('/')) return path;
  return `${SB_URL}/storage/v1/object/public/${SB_BUCKET}/${path}`;
}
