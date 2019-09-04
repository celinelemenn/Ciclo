const hider = () => {

  const element = document.querySelector('#hidden-nav');
  const navbar = document.querySelector('.navbar')

  if (element && navbar) {
    console.log('hidding nav bar');
    navbar.parentElement.removeChild(navbar);
    document.querySelector('.uni-app-container').classList.add('no-nav')
  };
};

const menu_hider = () => {
  const element = document.querySelector('#hidden-menu');
  const topmenu = document.querySelector('.top-menu');

  if (element) {
    console.log('hidding top menu');
    topmenu.parentElement.removeChild(topmenu);

  };
}

export { hider, menu_hider };


// /profiles/324324/edit
