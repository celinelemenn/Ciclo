import Typed from 'typed.js';

const loadDynamicBannerTitle = () => {
  const banner = document.querySelector("#banner-typed-text")
  if (banner) {
    new Typed('#banner-typed-text', {
      strings: ["A map with real-time reports from fellow cyclists",
                "Peer-reviewed roads condition, (wild) camping, hot-spots and many more",
                "Contact any fellow cyclists in one click."],
      typeSpeed: 70,
      loop: true
    });
  }
}

export { loadDynamicBannerTitle };
