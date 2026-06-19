-- ============================================================
--  Coffee Ghiri Homestay — Supabase schema
--  Run this in: Supabase Dashboard → SQL Editor → New query → Run
-- ============================================================

-- ---------- TABLES ----------

-- Global key/value settings: phone, email, whatsapp, address,
-- map coords, pricing, social links, certifications, etc.
create table if not exists settings (
  key        text primary key,
  value      text,
  updated_at timestamptz default now()
);

-- Editable text blocks per page/section (hero titles, eyebrows,
-- paragraphs, about story, host bio, section headings, etc.)
create table if not exists content (
  key        text primary key,   -- e.g. 'home.hero.title'
  value      text,
  updated_at timestamptz default now()
);

-- Activities (Activities page cards)
create table if not exists activities (
  id          uuid primary key default gen_random_uuid(),
  num         text,
  name        text not null,
  distance    text,
  description text,
  tag         text,
  image_path  text,
  sort_order  int default 0,
  visible     boolean default true,
  updated_at  timestamptz default now()
);

-- Facilities (Facilities page cards)
create table if not exists facilities (
  id          uuid primary key default gen_random_uuid(),
  name        text not null,
  description text,
  tag         text,
  icon_svg    text,
  image_path  text,
  sort_order  int default 0,
  visible     boolean default true,
  updated_at  timestamptz default now()
);

-- Reviews (Home + Contact reviews)
create table if not exists reviews (
  id          uuid primary key default gen_random_uuid(),
  author      text not null,
  rating      int  default 5,
  text        text,
  date_label  text,
  source      text default 'Google',
  sort_order  int default 0,
  visible     boolean default true,
  updated_at  timestamptz default now()
);

-- Gallery / highlight images
create table if not exists gallery (
  id          uuid primary key default gen_random_uuid(),
  image_path  text not null,
  caption     text,
  section     text default 'gallery',  -- 'gallery' | 'highlights'
  sort_order  int default 0,
  visible     boolean default true,
  updated_at  timestamptz default now()
);

-- ---------- ROW LEVEL SECURITY ----------
-- Public visitors: read-only.   Logged-in admin: full read/write.

alter table settings   enable row level security;
alter table content    enable row level security;
alter table activities enable row level security;
alter table facilities enable row level security;
alter table reviews    enable row level security;
alter table gallery    enable row level security;

do $$
declare t text;
begin
  foreach t in array array['settings','content','activities','facilities','reviews','gallery']
  loop
    execute format('drop policy if exists "public read %1$s" on %1$s;', t);
    execute format('drop policy if exists "admin write %1$s" on %1$s;', t);
    execute format('create policy "public read %1$s" on %1$s for select using (true);', t);
    execute format('create policy "admin write %1$s" on %1$s for all to authenticated using (true) with check (true);', t);
  end loop;
end $$;

-- ---------- DONE ----------
-- Next: create a public Storage bucket named "images" (Dashboard →
-- Storage → New bucket → name: images → Public bucket: ON).
