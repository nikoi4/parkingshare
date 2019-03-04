import Typed from 'typed.js';


const loadDynamicBannerText = () => {
  const bannerTyped = document.getElementById("banner-typed-text");

  if (bannerTyped) {
    new Typed('#banner-typed-text', {
      strings: ["If it fits,", "it sits"],
      typeSpeed: 50,
      loop: true
    });
  }
};

export { loadDynamicBannerText };
