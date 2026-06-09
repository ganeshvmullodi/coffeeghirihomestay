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
