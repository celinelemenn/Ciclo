import mapboxgl from "mapbox-gl";

const createPopdown = (marker_infowindow, marker = null) => {
  const popdown = document.querySelector(".popdown");
  popdown.innerHTML = marker_infowindow;
  popdown.classList.toggle("popdown-visible");

  const popdownClose = document.querySelector(".closing-cross-popdown");
  popdownClose.addEventListener("click", event => {
    popdown.classList = "popdown";
    if (marker) {
      marker.remove();
    }
  });
  const popdownCancel = document.querySelector(".cancel");
  if (popdownCancel) {
    popdownCancel.addEventListener("click", (event) => {
      popdown.classList = "popdown";
          if (marker) {
            marker.remove();
          }
    });
  }
  return popdown;
};

export { createPopdown };
