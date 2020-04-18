import { createPopdown } from "../../plugins/mapbox/create_popdown";
import mapboxgl from "mapbox-gl";

const addPoisToMap = (map, markers) => {
  markers.forEach((marker) => {
    const el = document.createElement("div");
    el.className = "marker poi-icon";
    const url = marker.marker_link;
    el.style.backgroundImage = `url(${url})`;
    el.style.width = "30px";
    el.style.height = "32px";

    // drop down
    el.addEventListener("click", function () {
      createPopdown(marker.infoWindow);
    });

    new mapboxgl.Marker(el).setLngLat([marker.lng, marker.lat]).addTo(map);
  });
};

export { addPoisToMap };
