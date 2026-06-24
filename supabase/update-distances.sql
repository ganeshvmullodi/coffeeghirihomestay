-- ============================================================
--  Coffee Ghiri Homestay — correct the activity distances
--  Run once in: SQL Editor → New query → Run.
--  Non-destructive: only updates the distance of existing cards.
-- ============================================================
update activities set distance='4 Kms',  updated_at=now() where name='Kudremukh Peak Trek';
update activities set distance='6 Kms',  updated_at=now() where name='Samse Tea Estate';
update activities set distance='3 Kms',  updated_at=now() where name='Somavathi Falls';
update activities set distance='20 Kms', updated_at=now() where name='Kurinjal Peak';
update activities set distance='41 Kms', updated_at=now() where name='Rani Jhari Hill Peak';
update activities set distance='18 Kms', updated_at=now() where name='Soormane Falls';
