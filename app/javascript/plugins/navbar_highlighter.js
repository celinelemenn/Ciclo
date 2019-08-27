const highlighter = () => {
  const path = document.location.pathname
  const linksPath = document.querySelectorAll('.anchor_link')
  const items = document.querySelectorAll('.navbar-item')
  // const links = []
  // items.forEach((item) => {
  //   const obj = new Object;
  //   obj.path = item.firstElementChild.pathname;
  //   obj.html = item;
  //   links.push(obj);
  // })
  // console.log(links);
  // links.forEach((link) => {
  //   link.html.classList.remove('active')
  //   if (document.location.pathname === link.path) {
  //     link.html.classList.add('active')
  //   }
  // })

  linksPath.forEach((link) => {
    items.forEach((item) => {
      item.classList.remove('active')
      if (path === link.pathname) {
        item.classList.add('active');
      }
    });
  });
}

export { highlighter };
