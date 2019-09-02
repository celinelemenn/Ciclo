const createPopdown = (marker_infowindow) => {
  const popdown = document.querySelector('.popdown')
    popdown.innerHTML = marker_infowindow;
    popdown.classList.toggle("popdown-visible");
  return popdown;
}

export { createPopdown };


