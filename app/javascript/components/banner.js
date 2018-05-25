import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Make your own cocktails", "Discover new cocktails"],
    typeSpeed: 40,
    loop: true
  });
}

export { loadDynamicBannerText };
