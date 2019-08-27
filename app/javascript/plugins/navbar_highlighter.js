const highlighter = () => {
  const path = document.location.pathname
  const linksPath = document.querySelectorAll('.anchor_link')

  linksPath.forEach((link) => {
    const items = document.querySelector('.navbar-item')
    items.forEach((item) => {
      if (path === link.pathname) {
        item.classList.add('active');
      }
    });
  });


  export { highlighter };
