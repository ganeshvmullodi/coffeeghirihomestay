-- ============================================================
--  Coffee Ghiri Homestay — Storage policies for the "images" bucket
--  Run once in: SQL Editor → New query → Run.
--  Public READ already works (bucket is marked Public).
--  These let the logged-in admin upload / replace / delete images.
-- ============================================================

drop policy if exists "admin upload images" on storage.objects;
drop policy if exists "admin update images" on storage.objects;
drop policy if exists "admin delete images" on storage.objects;

create policy "admin upload images"
  on storage.objects for insert to authenticated
  with check (bucket_id = 'images');

create policy "admin update images"
  on storage.objects for update to authenticated
  using (bucket_id = 'images');

create policy "admin delete images"
  on storage.objects for delete to authenticated
  using (bucket_id = 'images');
