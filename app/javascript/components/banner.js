import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["This was built by", "Meli"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };
