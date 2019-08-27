const highlighter = () => {
  const path = document.location.pathname
  const linksPath = document.querySelectorAll('.anchor_link')
  const activeItems = document.querySelectorAll('.navbar-item.active')

  activeItems.forEach(item => item.classList.remove('active'))

  linksPath.forEach((link) => {
    if (path === link.pathname) {
      link.parentElement.classList.add('active');
    }
  });
}

export { highlighter };
