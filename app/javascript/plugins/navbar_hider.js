const hider = () => {

  const element = document.querySelector('#hidden-nav');
  const navbar = document.querySelector('.navbar')

  if (element) {
    navbar.parentElement.removeChild(navbar);
  };
};

export { hider };


// /profiles/324324/edit
