const hider = () => {
  const element = document.querySelector('.uni-app-container');
  const pageUrl = window.location.href;
  if (pageUrl.indexOf("users") > -1) {
    element.classList.toggle("uni-app-container");
    element.classList.toggle("uni-app-container-no-navbar")
  };
};

export { hider };
