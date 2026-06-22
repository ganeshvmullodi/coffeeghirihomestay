-- ============================================================
--  Coffee Ghiri Homestay — editable page TEXT (content table)
--  Run AFTER schema.sql + seed.sql, in: SQL Editor → Run.
--  Lets the admin edit hero/heading/paragraph text per page.
--  Formatting markers you can use inside any value:
--    {i}..{/i} = italic (gold)   {b}..{/b} = bold   {br} = line break
--  Re-running is safe (upsert) but will reset these texts to below.
-- ============================================================
insert into content (key,value) values

-- ---------- HOME ----------
('home_hero_title',$$Back to{br}{i}Nature's{/i}{br}Embrace$$),
('home_hero_sub',$$Kudremukh Trekking Homestay$$),
('home_intro_eyebrow',$$Welcome To$$),
('home_intro_title',$$Coffee-Ghiri {i}Home Stay{/i}$$),
('home_intro_p1',$$Coffee Ghiri is a peaceful, offbeat homestay with warm hospitality, ideal for nature lovers, trekkers, or families seeking a restful getaway. The host-trained staff, home-cooked meals, and scenic location make it a memorable refuge.$$),
('home_intro_p2',$${b}Blend of rustic and modern:{/b} Enjoy the feel of nature with cozy nights and modern comforts. Facilities include avocado bonfires, home-style Malenadu cooking, caretaker support, luggage storage, kitchenette, and free breakfast.$$),
('home_intro_p3',$${b}Host & Hospitality:{/b} Run by Ganesh, an amiable host who's been hosting since 2019. He manages the property alongside his family and staff, and stays on-site to assist guests. Guests report smooth check-in/out, flexible policies, and a friendly on-site manager.$$),
('home_highlights_eyebrow',$$Highlights$$),
('home_highlights_title',$$Location & {i}Ambience{/i}$$),
('home_gallery_eyebrow',$$Photo Gallery$$),
('home_gallery_title',$$Through the {i}Lens{/i}$$),
('home_reviews_eyebrow',$$Google Reviews$$),
('home_reviews_title',$$What Our Guests {i}Say{/i}$$),
('home_cta_title',$$Ready to Escape to {i}the Ghats?{/i}$$),
('home_cta_text',$$Contact our host Ganesh directly and he will personally curate your stay — from arrival planning to trek arrangements and home-cooked meals. We welcome trekkers, families, and groups.$$),

-- ---------- ABOUT ----------
('about_hero_tag',$$Our Story$$),
('about_hero_title',$$About {i}Coffee Ghiri{/i}$$),
('about_story_eyebrow',$$Who We Are$$),
('about_story_title',$$A Home in the {i}Rain-Washed Mountains{/i}$$),
('about_story_p1',$$Coffee-ghiri is situated overlooking the picturesque village of Samse, bordering the Kudremukh national park at an elevation of {b}960 metres above sea level{/b}.$$),
('about_story_p2',$$The village is spread out across a wide area and is sparsely populated. The Kudremukh national park on the borders of the village is a densely forested wildlife sanctuary, home to a wonderful variety of flora and fauna and is also a designated tiger reserve.$$),
('about_story_quote',$$"Leading out from coffee-ghiri is a Hikers paradise which comprise off several lovely walks along the hills, which shelter sparkling streams and unbelievable breath taking water cascades."$$),
('about_host_eyebrow',$$Your Host$$),
('about_host_title',$$Meet {i}Ganesh{/i}$$),
('about_host_p1',$$Run by Ganesh, an amiable host who's been hosting since 2019. He manages the property alongside his family and staff, and stays on-site to assist guests.$$),
('about_host_p2',$$Guests report smooth check-in/out, flexible policies, and a friendly on-site manager.$$),
('about_host_p3',$$Coffee Ghiri is a peaceful, offbeat homestay with warm hospitality, ideal for nature lovers, trekkers, or families seeking a restful getaway. The host-trained staff, home-cooked meals, and scenic location make it a memorable refuge.$$),
('about_sur_eyebrow',$$What Surrounds Us$$),
('about_sur_title',$$Hills, Tea Gardens, {i}Waterfalls & More{/i}$$),

-- ---------- FACILITIES ----------
('fac_hero_tag',$$What We Offer$$),
('fac_hero_title',$$Our {i}Facilities{/i}$$),
('fac_intro_eyebrow',$$All Facilities$$),
('fac_intro_title',$$Everything You Need {i}in the Ghats{/i}$$),

-- ---------- ACTIVITIES ----------
('act_hero_tag',$$Explore the Ghats$$),
('act_hero_title',$$Activities {i}& Experiences{/i}$$),
('act_intro_eyebrow',$$Activities$$),
('act_intro_title',$$Explore the Untamed Beauty {i}Around Coffee Ghiri{/i}$$),
('act_intro_text',$$Nestled near the biodiversity-rich Kudremukh National Park, Coffee Ghiri is a gateway to some of the most stunning natural attractions and trekking trails in the Western Ghats. From majestic peaks to cascading waterfalls and vast tea estates, the surrounding landscape offers something for every nature lover, trekker, and photography enthusiast.$$),
('act_grid_eyebrow',$$All Activities$$),
('act_grid_title',$$9 Ways to {i}Explore{/i}$$),
('act_cta_title',$$Let Ganesh Plan Your {i}Adventure{/i}$$),
('act_cta_text',$$Contact our host directly and he will arrange your treks, guides, jeep transfers, and permits — everything you need for the perfect Kudremukh experience.$$),

-- ---------- CONTACT ----------
('contact_hero_tag',$$Get in Touch$$),
('contact_hero_title',$$Contact {i}& Book{/i}$$),

-- ---------- HOME extras (hero badge/buttons, stats, CTA) ----------
('home_hero_cert',$$Karnataka Tourism Certified Homestay$$),
('home_hero_loc',$$Mullodi · Kalasa · Chikmagalur · Western Ghats$$),
('home_hero_btn',$$Book Your Stay$$),
('home_stat1_n',$$960m$$),('home_stat1_l',$$Above Sea Level$$),
('home_stat2_n',$$4.5★$$),('home_stat2_l',$$GoIbibo Rating$$),
('home_stat3_n',$$126$$),('home_stat3_l',$$Google Reviews$$),
('home_stat4_n',$$2019$$),('home_stat4_l',$$Hosting Since$$),
('home_stat5_n',$$12+$$),('home_stat5_l',$$Nearby Activities$$),
('home_intro_btn1',$$Our Story$$),('home_intro_btn2',$$Facilities$$),
('home_cta_eyebrow',$$Plan Your Visit$$),
('home_cta_btn1',$$Book Your Stay$$),('home_cta_btn2',$$View Activities$$),

-- ---------- HERO IMAGES (background photos) ----------
('home_hero_poster',$$images/hero-poster.jpg$$),
('hero_about_img',$$images/gallery-1.jpg$$),
('hero_facilities_img',$$images/fac-tent.jpg$$),
('hero_activities_img',$$images/act-hero.jpg$$),
('hero_contact_img',$$images/contact-hero.jpg$$)

on conflict (key) do update set value = excluded.value, updated_at = now();
