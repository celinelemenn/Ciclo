import Typed from 'typed.js';

const loadDynamicBannerTitle = () => {
  new Typed('#banner-typed-text', {
    strings: ["Stay up-to-date on road conditions", "Get real-time reports from fellow cyclists",
              "Discover the best route, always"],
    typeSpeed: 60,
    loop: false
  });
}

export { loadDynamicBannerTitle };
