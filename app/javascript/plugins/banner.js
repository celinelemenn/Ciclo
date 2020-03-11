import Typed from 'typed.js';

const loadDynamicBannerTitle = () => {
  const banner = document.querySelector("#banner-typed-text")

  if (banner) {
    const message = I18n.t("home.why_cyclo.text")

    console.log(message)
    new Typed('#banner-typed-text', {
      strings: [message],
      typeSpeed: 70,
      loop: true
    });
  }
}

export { loadDynamicBannerTitle };
