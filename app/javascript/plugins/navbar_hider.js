const hider = () => {

  const element = document.querySelector('#hidden-nav');
  const navbar = document.querySelector('.navbar')

  if (element && navbar) {
    navbar.parentElement.removeChild(navbar);
    document.querySelector('.uni-app-container').classList.add('no-nav')
  };
};

const menu_hider = () => {
  const element = document.querySelector('#hidden-menu');
  const topmenu = document.querySelector('.top-menu');

  if (element) {
    topmenu.parentElement.removeChild(topmenu);

  };
}

export { hider, menu_hider };


// /profiles/324324/edit
