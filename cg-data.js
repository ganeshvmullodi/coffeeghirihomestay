// ============================================================
//  Coffee Ghiri Homestay — public data layer
//  Renders Activities, Facilities, Reviews, Highlights, Gallery
//  and contact/settings from Supabase. Falls back silently to
//  the static HTML already in the page if Supabase is unreachable.
//  Requires: supabase-js (CDN) + cg-supabase.js loaded first.
// ============================================================
(function(){
  if(typeof sb==='undefined') return;

  const ARROW='<svg viewBox="0 0 24 24"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>';
  const STAR='<svg viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>';
  const GOOGLE_G='<svg viewBox="0 0 24 24"><path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/><path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/><path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l3.66-2.84z" fill="#FBBC05"/><path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/></svg>';
  const AV_COLORS=['#4285F4','#34A853','#EA4335','#FBBC04','#8B6F47','#1A2B18'];

  const esc=s=>(s==null?'':String(s)).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
  const slug=s=>(s||'').toLowerCase().trim().replace(/[^a-z0-9]+/g,'-').replace(/^-+|-+$/g,'');
  const stars=n=>STAR.repeat(Math.max(1,Math.min(5,n||5)));
  const el=id=>document.getElementById(id);

  async function get(table,build){
    let q=sb.from(table).select('*').eq('visible',true);
    if(build) q=build(q);
    const { data, error } = await q;
    if(error){ console.warn('[cg-data]',table,error.message); return null; }
    return data;
  }

  // ---------- ACTIVITIES ----------
  async function activities(){
    const box=el('cgActivities'); if(!box) return;
    const rows=await get('activities',q=>q.order('sort_order'));
    if(!rows||!rows.length) return;
    box.innerHTML=rows.map(r=>{
      const name=esc(r.name)+(r.distance?' – '+esc(r.distance):'');
      return `<div class="ac" id="${slug(r.name)}">
        <img class="ac-img" src="${esc(sbImage(r.image_path))}" alt="${esc(r.name)}" loading="lazy">
        <div class="ac-veil"></div>
        <div class="ac-body">
          <div class="ac-num">${esc(r.num||'')}</div>
          <div class="ac-name">${name}</div>
          <div class="ac-desc">${esc(r.description)}</div>
          ${r.tag?`<div class="ac-tag">${esc(r.tag)} ${ARROW}</div>`:''}
        </div></div>`;
    }).join('');
  }

  // ---------- FACILITIES ----------
  async function facilities(){
    const box=el('cgFacilities'); if(!box) return;
    const rows=await get('facilities',q=>q.order('sort_order'));
    if(!rows||!rows.length) return;
    box.innerHTML=rows.map(r=>`<div class="fc">
      <img class="fc-img" src="${esc(sbImage(r.image_path))}" alt="${esc(r.name)}" loading="lazy">
      <div class="fc-body">
        <div class="fc-icon"><svg viewBox="0 0 24 24">${r.icon_svg||''}</svg></div>
        <div class="fc-title">${esc(r.name)}</div>
        <div class="fc-text">${esc(r.description)}</div>
        ${r.tag?`<div class="fc-tag">${esc(r.tag)}</div>`:''}
      </div></div>`).join('');
  }

  // ---------- REVIEWS ----------
  async function reviews(){
    const box=el('cgReviews'); if(!box) return;
    const rows=await get('reviews',q=>q.order('sort_order'));
    if(!rows||!rows.length) return;
    box.innerHTML=rows.map((r,i)=>{
      const color=AV_COLORS[i%AV_COLORS.length];
      const txtColor=color==='#FBBC04'?';color:#333':'';
      const initial=esc((r.author||'?').trim().charAt(0).toUpperCase());
      return `<div class="gr-card">
        <div class="gr-card-g">${GOOGLE_G}</div>
        <div class="gr-reviewer">
          <div class="gr-avatar" style="background:${color}${txtColor}">${initial}</div>
          <div><div class="gr-reviewer-name">${esc(r.author)}</div><div class="gr-reviewer-meta">${esc(r.source||'Google Review')}</div></div>
        </div>
        <div class="gr-card-stars">${stars(r.rating)}</div>
        <div class="gr-card-quote">${esc(r.text)}</div>
        ${r.date_label?`<div class="gr-card-date">${esc(r.date_label)}</div>`:''}
      </div>`;
    }).join('');
  }

  // ---------- HIGHLIGHTS ----------
  function hlLinkText(link){
    const l=(link||'').toLowerCase();
    if(l.includes('activities')) return 'Explore Activities';
    if(l.includes('facilities')) return 'View Facilities';
    if(l.includes('contact')) return 'Book Your Stay';
    return 'Discover More';
  }
  async function highlights(){
    const box=el('cgHighlights'); if(!box) return;
    const rows=await get('gallery',q=>q.eq('section','highlights').order('sort_order'));
    if(!rows||!rows.length) return;
    box.innerHTML=rows.map((r,i)=>`<div class="hl-item">
      <img class="hl-bg" src="${esc(sbImage(r.image_path))}" alt="${esc(r.title)}">
      <div class="hl-veil"></div>
      <div class="hl-body">
        <div class="hl-num">${String(i+1).padStart(2,'0')}</div>
        <div class="hl-name">${esc(r.title)}</div>
        <div class="hl-desc">${esc(r.caption)}</div>
        ${r.link?`<a href="${esc(r.link)}" class="hl-link">${hlLinkText(r.link)} ${ARROW}</a>`:''}
      </div></div>`).join('');
  }

  // ---------- GALLERY ----------
  async function gallery(){
    const box=el('cgGallery'); if(!box) return;
    const rows=await get('gallery',q=>q.eq('section','gallery').order('sort_order'));
    if(!rows||!rows.length) return;
    box.innerHTML=rows.map((r,i)=>`<div class="gi ${i===0?'gi-tall':'gi-sq'}"><img src="${esc(sbImage(r.image_path))}" alt="${esc(r.caption||'Coffee Ghiri Homestay')}" loading="lazy"></div>`).join('');
  }

  // ---------- PAGE TEXT (content table) ----------
  // Safe rich text: escape everything, then allow only {i}{/i} {b}{/b} {br}.
  function richText(v){
    return esc(v)
      .replace(/\{i\}/g,'<i>').replace(/\{\/i\}/g,'</i>')
      .replace(/\{b\}/g,'<strong>').replace(/\{\/b\}/g,'</strong>')
      .replace(/\{br\}/g,'<br>');
  }
  async function content(){
    const nodes=document.querySelectorAll('[data-cg-text],[data-cg-img],[data-cg-bg],[data-cg-poster]');
    if(!nodes.length) return;
    const { data, error } = await sb.from('content').select('key,value');
    if(error||!data) return;
    const C={}; data.forEach(r=>C[r.key]=r.value);
    nodes.forEach(n=>{
      if(n.dataset.cgText!=null && C[n.dataset.cgText]!=null) n.innerHTML=richText(C[n.dataset.cgText]);
      if(n.dataset.cgImg && C[n.dataset.cgImg]) n.setAttribute('src', sbImage(C[n.dataset.cgImg]));
      if(n.dataset.cgBg && C[n.dataset.cgBg]) n.style.backgroundImage='url("'+sbImage(C[n.dataset.cgBg])+'")';
      if(n.dataset.cgPoster && C[n.dataset.cgPoster]) n.setAttribute('poster', sbImage(C[n.dataset.cgPoster]));
    });
  }

  // ---------- SETTINGS (contact info, links) ----------
  async function settings(){
    const targets=document.querySelectorAll('[data-cg-set],[data-cg-href],[data-cg-tel],[data-cg-wa],[data-cg-mailto]');
    if(!targets.length) return;
    const { data, error } = await sb.from('settings').select('key,value');
    if(error||!data) return;
    const S={}; data.forEach(r=>S[r.key]=r.value);
    targets.forEach(node=>{
      if(node.dataset.cgSet!=null && S[node.dataset.cgSet]!=null) node.textContent=S[node.dataset.cgSet];
      if(node.dataset.cgHref && S[node.dataset.cgHref]) node.setAttribute('href',S[node.dataset.cgHref]);
      if(node.dataset.cgTel && S[node.dataset.cgTel]) node.setAttribute('href','tel:'+S[node.dataset.cgTel].replace(/\s/g,''));
      if(node.dataset.cgWa && S[node.dataset.cgWa]) node.setAttribute('href','https://wa.me/'+S[node.dataset.cgWa]);
      if(node.dataset.cgMailto && S[node.dataset.cgMailto]) node.setAttribute('href','mailto:'+S[node.dataset.cgMailto]);
    });
  }

  // run whichever sections exist on this page
  activities(); facilities(); reviews(); highlights(); gallery(); content(); settings();
})();
