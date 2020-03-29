import Typed from "typed.js";

const loadDynamicBannerTitle = () => {
  const banner = document.querySelector("#banner-typed-text");
  let locale = document.querySelector(".uni-app-container").dataset.locale;
  if (banner) {
    const message = I18n.t("home.why_cyclo.text", { locale: locale || "en" });

    console.log(message);
    new Typed("#banner-typed-text", {
      strings: [message],
      typeSpeed: 70,
      loop: true
    });
  }
};

export { loadDynamicBannerTitle };
