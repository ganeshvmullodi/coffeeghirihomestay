-- ============================================================
--  Coffee Ghiri Homestay — add 3 new activity cards
--  Run once in: SQL Editor → New query → Run.
--  Safe to re-run (it removes these names first, then re-adds).
-- ============================================================
delete from activities where name in ('Baamikonda Viewpoint','Netravati Trek Base','Gangadikallu Trek Base');

insert into activities (num,name,distance,description,tag,image_path,sort_order) values
('10',$$Baamikonda Viewpoint$$,$$3 Kms$$,$$Just 3 km from the homestay, Baamikonda is a breezy viewpoint that opens onto rolling Western Ghats hills and tea-clad slopes — an easy, rewarding spot for sunrise, sunset and photography.$$,$$Short Drive · Sunrise Spot$$,$$images/act-baamikonda.jpg$$,10),
('11',$$Netravati Trek Base$$,$$8 Kms$$,$$About 8 km away, this is the starting point for the classic Netravati Peak trek. The trail climbs through mist-wrapped grasslands and shola forest to dramatic cliff-edge views over the Ghats.$$,$$Full Day · Guide Recommended$$,$$images/act-netravati.jpg$$,11),
('12',$$Gangadikallu Trek Base$$,$$25 Kms$$,$$Around 25 km from the homestay, Gangadikallu is a lesser-known trek in the Kudremukh range, rewarding trekkers with sweeping ridge-top views across green valleys and distant reservoirs.$$,$$Full Day · Scenic Trek$$,$$images/act-gangadikallu.jpg$$,12);

-- keep the grid heading count in sync
update content set value=$$12 Ways to {i}Explore{/i}$$, updated_at=now() where key='act_grid_title';
