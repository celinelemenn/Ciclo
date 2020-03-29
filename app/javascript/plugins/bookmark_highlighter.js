const bookmark_highlighter = () => {
  const linksPath = document.querySelectorAll(".btn-bookmark");

  linksPath.forEach(link => {
    const activeItems = document.querySelectorAll(".btn-bookmark-active");
    activeItems.forEach(item => item.classList.remove("btn-bookmark-active"));
    const active = document.querySelectorAll(".btn-bookmark")[0].parentNode
      .children[1].innerText;
    if (active == "1") {
      link.parentElement.classList.add("btn-bookmark-active");
    }
  });
};

export { bookmark_highlighter };
