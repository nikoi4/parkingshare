import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Find the parking that you need, <br> Earn the money that you want."],
    typeSpeed: 100,
    loop: true,
    showCursor: false,
  });
};

export { loadDynamicBannerText };
