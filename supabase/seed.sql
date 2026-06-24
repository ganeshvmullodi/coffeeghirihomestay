-- ============================================================
--  Coffee Ghiri Homestay — initial content seed
--  Run AFTER schema.sql, in: SQL Editor → New query → Run.
--  Safe to re-run: it clears the list tables and re-inserts.
--  (settings/content use upsert so your later edits to those
--   keys are only overwritten if you re-run this file.)
-- ============================================================

-- Highlight cards (homepage "Location & Ambience") need a title +
-- link in addition to an image, so extend the gallery table once.
alter table gallery add column if not exists title text;
alter table gallery add column if not exists link  text;

-- ---------- ACTIVITIES (Activities page) ----------
truncate table activities;
insert into activities (num,name,distance,description,tag,image_path,sort_order) values
('01',$$Kudremukh Peak Trek$$,$$4 Kms$$,$$One of the most sought-after treks in South India, the Kudremukh Peak trail leads you through rolling grasslands, misty valleys, and shola forests. The panoramic views from the summit are breathtaking, making the 9 km trek a must-do for adventure seekers.$$,$$Full Day · Guide Required$$,$$images/act-kudremukh-trek.jpg$$,1),
('02',$$Samse Tea Estate$$,$$6 Kms$$,$$Just a stone's throw away, the lush Samse Tea Estate offers a scenic walk through neatly manicured tea gardens. Learn about tea cultivation, enjoy peaceful strolls, and capture Instagram-worthy views.$$,$$2–3 Hours · Self-guided$$,$$images/act-samse-tea.jpg$$,2),
('03',$$Somavathi Falls$$,$$3 Kms$$,$$Tucked amidst the forested hills, these twin waterfalls are perfect for a refreshing break. A short hike takes you to these serene spots, ideal for nature walks, photography, and quiet contemplation.$$,$$Half Day · Jeep Recommended$$,$$images/act-somavathi-falls.jpg$$,3),
('04',$$Elaneer Falls$$,$$4 Kms$$,$$A picturesque waterfall surrounded by forest, Elaneer is perfect for a short morning or evening outing. It's an easy walk and ideal for families or groups looking to enjoy nature up close.$$,$$Early Morning · Binoculars Advised$$,$$images/act-elaneer-falls.jpg$$,4),
('05',$$Mydadi Hill Point$$,$$14 Kms$$,$$A beautiful highland viewpoint, Mydadi offers spectacular sunrise and sunset views. It's a quiet, lesser-trodden destination perfect for photography or a romantic outing.$$,$$Overnight · Tent Provided$$,$$images/act-mydadi-hill.jpg$$,5),
('06',$$Kudremukh Forest$$,$$6 Kms$$,$$A treasure trove of biodiversity, the Kudremukh forest is home to rich flora and fauna, including endemic birds and wildlife. Nature walks and forest drives here provide a deep connection with the wild.$$,$$Evening Drive · Jeep Arranged$$,$$images/act-kudremukh-forest.jpg$$,6),
('07',$$Kurinjal Peak$$,$$20 Kms$$,$$A relatively lesser-known trek, Kurinjal Peak offers a peaceful alternative to Kudremukh. The trail passes through dense vegetation and rewards you with sweeping views of the Western Ghats — perfect for those seeking solitude in nature.$$,$$Full Day · Guide Recommended$$,$$images/act-kurinjal-peak.jpg$$,7),
('08',$$Rani Jhari Hill Peak$$,$$41 Kms$$,$$Known for its panoramic valley views and mist-laced cliffs, Rani Jhari is a dramatic viewpoint that attracts both trekkers and nature photographers. The drive and final hike make for a memorable day trip.$$,$$Half Day · Scenic Drive$$,$$images/act-ranijhari.jpg$$,8),
('09',$$Soormane Falls$$,$$18 Kms$$,$$Hidden within the forest, Soormane Falls is a secluded gem. The journey involves a scenic trek and a chance to experience untouched nature — ideal for explorers and waterfall chasers.$$,$$Dawn to Dusk · Any Skill Level$$,$$images/act-soormane-falls.jpg$$,9);

-- ---------- FACILITIES (Facilities page) ----------
truncate table facilities;
insert into facilities (name,description,tag,icon_svg,image_path,sort_order) values
($$Authentic Malenadu Cuisine (Veg & Non-Veg)$$,$$Savor the rich and flavorful dishes of Malenadu – a cuisine known for its spices, fresh ingredients, and homely touch. From hearty vegetarian meals to traditional non-veg delicacies, our kitchen serves authentic local food that completes your hillside retreat experience.$$,$$Veg & Non-Veg Available$$,$$<path d="M18 8h1a4 4 0 010 8h-1"/><path d="M2 8h16v9a4 4 0 01-4 4H6a4 4 0 01-4-4V8z"/><line x1="6" y1="1" x2="6" y2="4"/><line x1="10" y1="1" x2="10" y2="4"/><line x1="14" y1="1" x2="14" y2="4"/>$$,$$images/fac-cuisine.jpg$$,1),
($$Avocado Bonfires & Prayer Camp$$,$$Unwind under the starlit sky around a warm, crackling bonfire. It's the perfect setting to share stories, enjoy music, and bond with fellow travelers after a day of trekking or sightseeing. Our bonfire nights are a highlight for guests seeking relaxation and a rustic experience in the lap of nature.$$,$$Bonfire Nights$$,$$<path d="M12 12c2 -2.96 0 -7 -1 -8c0 3.038 -1.773 4.741 -3 6c-1.226 1.26 -2 3.24 -2 5a6 6 0 1 0 12 0c0 -1.532 -1.056 -3.94 -2 -5c-1.786 3 -2.791 3 -4 2z"/>$$,$$images/gallery-3.jpg$$,2),
($$4x4 Jeep Rides for Off-Road Adventures$$,$$Explore the rugged terrain and hidden trails of the Western Ghats with our 4×4 Jeep facility. These powerful vehicles are ideal for reaching remote viewpoints, waterfalls, and starting points of treks that regular vehicles can't access. It's a thrilling way to experience the wild beauty of the region.$$,$$Available on Request$$,$$<rect x="1" y="3" width="15" height="13" rx="2"/><path d="M16 8h4l3 3v5h-7V8z"/><circle cx="5.5" cy="18.5" r="2.5"/><circle cx="18.5" cy="18.5" r="2.5"/>$$,$$images/fac-jeep.jpg$$,3),
($$Clean Attached Washrooms$$,$$We prioritize hygiene and comfort with clean, well-maintained attached washrooms in our accommodations. Whether you're staying in tents or rooms, you'll have private facilities ensuring convenience after long days of exploration.$$,$$Hot Water Available$$,$$<path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/>$$,$$images/gallery-5.jpg$$,4),
($$Private Rooms for Couples$$,$$For those seeking privacy and comfort, our couple rooms offer a peaceful retreat with all essential amenities. Ideal for romantic getaways or quiet relaxation, these rooms provide a cozy atmosphere amidst serene natural surroundings.$$,$$Married Couples Only$$,$$<path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 000-7.78z"/>$$,$$images/fac-couple-room.jpg$$,5),
($$Trek Passes to Kudremukh Peak$$,$$Planning to conquer the majestic Kudremukh Peak? We assist you in obtaining official trek permits, saving you the hassle. As the trek lies within a protected national park, permits are mandatory. We ensure a smooth process so you can focus on the adventure ahead.$$,$$Permit Assistance$$,$$<path d="M17 8C8 10 5.9 16.17 3.82 19.54L4.3 20a24.7 24.7 0 002.52-2C8.39 19.72 9.43 21 12 21c6 0 10-5 10-10 0-2-1-4-5-3z"/><path d="M12 13c0 1.3-.84 2-2 2s-2-.84-2-2 .84-2 2-2 2 .84 2 2z"/>$$,$$images/fac-trek-pass.jpg$$,6),
($$Comfortable Tent Stays (Temporarily Closed)$$,$$Our spacious tents provide a close-to-nature stay without compromising on comfort. Equipped with cozy bedding and essentials, the tent accommodations let you enjoy the wilderness while staying safe and comfortable — perfect for nature lovers and adventure seekers.$$,$$Nature-close Stay$$,$$<rect x="2" y="7" width="20" height="14" rx="2" ry="2"/><path d="M16 21V5a2 2 0 00-2-2h-4a2 2 0 00-2 2v16"/>$$,$$images/fac-tent.jpg$$,7);

-- ---------- REVIEWS (Homepage Google reviews) ----------
truncate table reviews;
insert into reviews (author,rating,text,date_label,source,sort_order) values
($$Nagaraj Hirekodi$$,5,$$We had an amazing stay! The food was absolutely delicious, and everyone made us feel so welcome and … Read more$$,$$July 2025$$,$$Local Guide · Google$$,1),
($$Vittal Gurav$$,5,$$Very nice hospitality humble staff and good location$$,$$July 2025$$,$$Google Review$$,2),
($$Kaana Darshan Aradhya$$,5,$$I will give 10/10 for this Coffee Ghiri Homestay. We had spent 2 days here and everything felt more than worth. Very much satisfied with the service, especially food..and location is as mesmerizing and as pure as it really is... Overall great experience..💯🔥🥂$$,$$June 2025$$,$$Google Review$$,3),
($$KHUSHI Ak$$,5,$$Very Good Service and Food is Excellent and Rooms is also Good$$,$$July 2025$$,$$Google Review$$,4),
($$Vijay Kattimani$$,5,$$Nice place very near to Kudremukha trekking point. Friendly staff, over very good stay option for th… Read more$$,$$July 2025$$,$$Google Review$$,5),
($$Sunmathi Periyasamy$$,5,$$We stayed here during our Kudremukh trekking trip with friends and had a wonderful experience. The rooms were well-maintained, clean, and comfortable. The owner was extremely kind, responsible, and made sure everything was taken care of.$$,$$June 2025$$,$$Google Review$$,6);

-- ---------- HIGHLIGHTS + GALLERY (Homepage) ----------
truncate table gallery;
-- Homepage "Location & Ambience" highlight cards
insert into gallery (section,title,caption,link,image_path,sort_order) values
($$highlights$$,$$Kudremukh A Trekkers Delight$$,$$Kudremukh Trek — Coffee Ghiri sits at the base of the Kudremukh trail, making it perfect as a starting point. It's part of the Mullodi–Samse–Kalasa trekking region.$$,$$activities.html$$,$$images/highlight-kudremukh-trek.jpg$$,1),
($$highlights$$,$$Food & Stay Package$$,$$"Member" package: ~₹1,300 for one day (3 meals + dinner), hot water, prayer camp in the evening, etc.$$,$$facilities.html$$,$$images/highlight-food-stay.jpg$$,2),
($$highlights$$,$$Scenic Photography Spots$$,$$Beautiful views of Kalasa and surrounding coffee plantations — ideal for early morning shots.$$,$$activities.html$$,$$images/highlight-photography.jpg$$,3);
-- Homepage "Through the Lens" gallery strip
insert into gallery (section,caption,image_path,sort_order) values
($$gallery$$,$$Coffee Ghiri Homestay illuminated at night$$,$$images/gallery-1.jpg$$,1),
($$gallery$$,$$Coffee Ghiri Homestay$$,$$images/gallery-2.jpg$$,2),
($$gallery$$,$$Avocado bonfire evening$$,$$images/gallery-3.jpg$$,3),
($$gallery$$,$$Coffee Ghiri Homestay$$,$$images/gallery-4.jpg$$,4),
($$gallery$$,$$Clean attached washroom$$,$$images/gallery-5.jpg$$,5);

-- ---------- SETTINGS (contact, pricing, ratings) ----------
insert into settings (key,value) values
('contact_phone',$$094811 54240$$),
('contact_phone_intl',$$919481154240$$),
('contact_email',$$ganeshvmullodi@gmail.com$$),
('whatsapp_number',$$919481154240$$),
('address_line1',$$Coffee Ghiri Homestay$$),
('address_line2',$$Mullodi, Balagal, Kalasa$$),
('address_line3',$$Mudigere, Chikmagalur$$),
('address_line4',$$Karnataka — 577 124$$),
('map_lat',$$13.1716577$$),
('map_lng',$$75.3115618$$),
('map_place_id',$$ChIJR-cyympKuzsRbPTWgRf6czc$$),
('map_cid',$$3995812273277301868$$),
('price_day',$$1300$$),
('rating_google',$$5.0$$),
('reviews_count',$$126$$),
('rating_goibibo',$$4.5$$),
('altitude',$$960m$$),
('since_year',$$2019$$),
('activities_count',$$12+$$),
('tagline',$$Back to Nature, Back to You$$),
('brand_desc',$$Coffee Ghiri is a peaceful, offbeat homestay with warm hospitality, ideal for nature lovers, trekkers, or families seeking a restful getaway. The host-trained staff, home-cooked meals, and scenic location make it a memorable refuge.$$),
('instagram_url',$$#$$),
('facebook_url',$$#$$)
on conflict (key) do update set value = excluded.value, updated_at = now();

-- ---------- DONE ----------
