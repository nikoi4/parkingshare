import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Tired of driving around", "You are hurried", "Don't want to wait", "parkingshare!!"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };
