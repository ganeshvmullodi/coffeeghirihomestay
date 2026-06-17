// CURSOR
const cur=document.getElementById('cur'),curR=document.getElementById('curR');
let mx=0,my=0,rx=0,ry=0;
if(!window.matchMedia('(hover:none)').matches){
  document.addEventListener('mousemove',e=>{mx=e.clientX;my=e.clientY});
  (function t(){rx+=(mx-rx)*.11;ry+=(my-ry)*.11;cur.style.left=mx+'px';cur.style.top=my+'px';curR.style.left=rx+'px';curR.style.top=ry+'px';requestAnimationFrame(t)})();
  document.querySelectorAll('a,button,.act-item,.rc,.pkg,.fc,.gi,.ai-item').forEach(el=>{
    el.addEventListener('mouseenter',()=>{cur.style.width='16px';cur.style.height='16px';curR.style.width='50px';curR.style.height='50px';curR.style.opacity='.2'});
    el.addEventListener('mouseleave',()=>{cur.style.width='8px';cur.style.height='8px';curR.style.width='32px';curR.style.height='32px';curR.style.opacity='1'});
  });
}
// NAV
const nav=document.getElementById('nav');
if(nav){
  const solid=nav.classList.contains('solid-nav');
  if(!solid) window.addEventListener('scroll',()=>nav.classList.toggle('s',window.scrollY>60),{passive:true});
}
// BURGER
const burger=document.getElementById('burger'),mob=document.getElementById('mobMenu');
if(burger&&mob){
  burger.addEventListener('click',()=>{
    const o=burger.classList.toggle('open');
    mob.style.display='flex';
    setTimeout(()=>mob.classList.toggle('open',o),10);
    if(!o){mob.classList.remove('open');setTimeout(()=>mob.style.display='none',400);}
  });
  document.querySelectorAll('.mob-link').forEach(a=>{
    a.addEventListener('click',()=>{burger.classList.remove('open');mob.classList.remove('open');setTimeout(()=>mob.style.display='none',400);});
  });
}
// REVEAL
const obs=new IntersectionObserver(e=>{e.forEach(x=>{if(x.isIntersecting)x.target.classList.add('vi')})},{threshold:.07,rootMargin:'0px 0px -30px 0px'});
document.querySelectorAll('.rv,.rv-l,.rv-r').forEach(el=>obs.observe(el));

// WHATSAPP FORM MODAL — fills in details, sends them all to WhatsApp
(function(){
  const WA_DEFAULT='919481154240';
  const ICON='<svg viewBox="0 0 24 24"><path d="M19.05 4.91A9.82 9.82 0 0 0 12.04 2C6.58 2 2.13 6.45 2.13 11.91c0 1.75.46 3.45 1.32 4.95L2.05 22l5.25-1.38a9.87 9.87 0 0 0 4.74 1.21h.01c5.46 0 9.91-4.45 9.91-9.91 0-2.65-1.03-5.14-2.91-7.01zM12.04 20.15h-.01a8.2 8.2 0 0 1-4.18-1.15l-.3-.18-3.12.82.83-3.04-.2-.31a8.18 8.18 0 0 1-1.26-4.38c0-4.54 3.7-8.24 8.24-8.24 2.2 0 4.27.86 5.82 2.42a8.18 8.18 0 0 1 2.41 5.83c0 4.54-3.7 8.23-8.25 8.23zm4.52-6.16c-.25-.12-1.47-.72-1.69-.81-.23-.08-.39-.12-.56.12-.17.25-.64.81-.78.97-.14.17-.29.19-.54.06-.25-.12-1.05-.39-1.99-1.23-.74-.66-1.23-1.47-1.38-1.72-.14-.25-.02-.38.11-.51.11-.11.25-.29.37-.43.12-.14.17-.25.25-.41.08-.17.04-.31-.02-.43-.06-.12-.56-1.34-.76-1.84-.2-.48-.4-.42-.56-.43h-.48c-.17 0-.43.06-.66.31-.23.25-.86.85-.86 2.07 0 1.22.89 2.4 1.01 2.56.12.17 1.75 2.67 4.23 3.74.59.26 1.05.41 1.41.52.59.19 1.13.16 1.56.1.48-.07 1.47-.6 1.68-1.18.21-.58.21-1.07.14-1.18-.06-.11-.22-.17-.47-.29z"/></svg>';
  const wrap=document.createElement('div');
  wrap.id='wafOverlay';wrap.className='waf-overlay';
  wrap.innerHTML='<div class="waf-card" role="dialog" aria-modal="true" aria-label="Contact via WhatsApp">'+
    '<div class="waf-head"><div class="waf-head-icon">'+ICON+'</div>'+
    '<div class="waf-head-txt"><b>Contact via WhatsApp</b><span>We usually reply within a few hours</span></div>'+
    '<button type="button" class="waf-close" aria-label="Close">&times;</button></div>'+
    '<form class="waf-body" novalidate>'+
    '<div class="waf-field" data-f="name"><label>Name</label><input type="text" name="name" placeholder="Enter your Name" autocomplete="name"><div class="waf-err">Please enter your name</div></div>'+
    '<div class="waf-field" data-f="email"><label>Email</label><input type="email" name="email" placeholder="Enter your Email" autocomplete="email"><div class="waf-err">Please enter a valid email</div></div>'+
    '<div class="waf-field" data-f="phone"><label>Phone</label><input type="tel" name="phone" placeholder="Enter your Phone" autocomplete="tel"><div class="waf-err">Please enter your phone number</div></div>'+
    '<div class="waf-field" data-f="adults"><label>Number of Adults</label><input type="number" name="adults" min="1" max="30" inputmode="numeric" placeholder="e.g. 2"><div class="waf-err">Please enter number of adults</div></div>'+
    '<div class="waf-row">'+
    '<div class="waf-field" data-f="checkin"><label>Check-in Date</label><input type="date" name="checkin"><div class="waf-err">Select a date</div></div>'+
    '<div class="waf-field" data-f="checkout"><label>Check-out Date</label><input type="date" name="checkout"><div class="waf-err">Select a valid date</div></div>'+
    '</div>'+
    '<div class="waf-field" data-f="message"><label>Message <span style="color:#aaa;font-weight:400">(optional)</span></label><textarea name="message" placeholder="Enter your Message"></textarea></div>'+
    '<button type="submit" class="waf-submit">'+ICON+'Send on WhatsApp</button></form></div>';
  document.body.appendChild(wrap);

  let waNumber=WA_DEFAULT;
  const form=wrap.querySelector('.waf-body');
  const fld=k=>form.querySelector('[name="'+k+'"]');
  const grp=k=>form.querySelector('[data-f="'+k+'"]');
  const open=num=>{if(num)waNumber=num;wrap.classList.add('open');setTimeout(()=>fld('name').focus(),140);};
  const close=()=>wrap.classList.remove('open');

  // dates can't be in the past; check-out can't precede check-in
  const today=new Date().toISOString().slice(0,10);
  fld('checkin').min=today;fld('checkout').min=today;
  fld('checkin').addEventListener('change',()=>{
    fld('checkout').min=fld('checkin').value||today;
    if(fld('checkout').value&&fld('checkout').value<fld('checkin').value)fld('checkout').value='';
  });
  const MONTHS=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  const fmtDate=v=>{if(!v)return '';const p=v.split('-');return p[2]+' '+MONTHS[+p[1]-1]+' '+p[0];};

  document.querySelectorAll('a[href*="wa.me"],a[href*="api.whatsapp.com"],a[href*="whatsapp.com/send"]').forEach(a=>{
    a.addEventListener('click',e=>{
      e.preventDefault();
      const m=(a.getAttribute('href')||'').match(/(\d{8,15})/);
      open(m?m[1]:WA_DEFAULT);
    });
  });

  wrap.addEventListener('click',e=>{if(e.target===wrap)close();});
  wrap.querySelector('.waf-close').addEventListener('click',close);
  document.addEventListener('keydown',e=>{if(e.key==='Escape'&&wrap.classList.contains('open'))close();});
  form.querySelectorAll('input,textarea').forEach(el=>el.addEventListener('input',()=>el.closest('.waf-field').classList.remove('invalid')));

  form.addEventListener('submit',e=>{
    e.preventDefault();
    const name=fld('name').value.trim(),email=fld('email').value.trim(),phone=fld('phone').value.trim(),adults=fld('adults').value.trim(),checkin=fld('checkin').value,checkout=fld('checkout').value,message=fld('message').value.trim();
    let ok=true;
    grp('name').classList.toggle('invalid',!name);if(!name)ok=false;
    const emailOk=/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(email);grp('email').classList.toggle('invalid',!emailOk);if(!emailOk)ok=false;
    grp('phone').classList.toggle('invalid',phone.replace(/\D/g,'').length<7);if(phone.replace(/\D/g,'').length<7)ok=false;
    grp('adults').classList.toggle('invalid',!(parseInt(adults,10)>=1));if(!(parseInt(adults,10)>=1))ok=false;
    grp('checkin').classList.toggle('invalid',!checkin);if(!checkin)ok=false;
    const coBad=!checkout||(checkin&&checkout<checkin);grp('checkout').classList.toggle('invalid',coBad);if(coBad)ok=false;
    if(!ok)return;
    const text='Name: '+name+'\nEmail: '+email+'\nPhone: '+phone+'\nNumber of Adults: '+adults+'\nCheck-in: '+fmtDate(checkin)+'\nCheck-out: '+fmtDate(checkout)+'\nMessage: '+message;
    window.open('https://wa.me/'+waNumber+'?text='+encodeURIComponent(text),'_blank');
    close();form.reset();
  });
})();
