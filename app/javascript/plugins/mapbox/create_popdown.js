const createPopdown = (marker_infowindow) => {
  const popdown = document.querySelector('.popdown')
    popdown.innerHTML = marker_infowindow;
    popdown.classList.toggle("popdown-visible");
    const popdownClose = document.querySelector('.closing-cross-popdown');
    popdownClose.addEventListener("click", event => {
    popdown.classList = 'popdown';
  });
  return popdown;
}


export { createPopdown };


