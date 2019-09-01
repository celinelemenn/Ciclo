import Typed from 'typed.js';

const loadDynamicBannerTitle = () => {
  new Typed('#banner-typed-text', {
    strings: ["Get real-time reports from fellow cyclists",
              "Discover peer-reviewed hot-spots",
              "Take the road less travelled, with confidence"],
    typeSpeed: 55,
    loop: false
  });
}

export { loadDynamicBannerTitle };
