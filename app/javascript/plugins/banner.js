import Typed from 'typed.js';

const loadDynamicBannerTitle = () => {
  const banner = document.querySelector("#banner-typed-text")
  if (banner) {
    new Typed('#banner-typed-text', {
      strings: ["Get real-time reports from fellow cyclists",
                "Discover peer-reviewed hot-spots",
                "Take the road less travelled, with confidence."],
      typeSpeed: 50,
      loop: false
    });
  }
}

export { loadDynamicBannerTitle };
