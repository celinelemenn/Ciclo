import { createPopdown } from "../../plugins/mapbox/create_popdown";
import mapboxgl from "mapbox-gl";

const addCyslistToMap = (map, cyclists) => {
  const mapElement = document.getElementById("map");

  if (mapElement) {
    cyclists.forEach(cyclist => {
      const el = document.createElement("div");
      el.className = "marker cyclist-avatar";
      const url = "https://i.imgur.com/dEwa4Bt.png";
      el.style.backgroundImage = `url(${url}`;
      el.style.width = "50px";
      el.style.height = "50px";

      el.addEventListener("click", function() {
        createPopdown(cyclist.infoWindow);
      });

      new mapboxgl.Marker(el).setLngLat([cyclist.lng, cyclist.lat]).addTo(map);
    });
  }
};

export { addCyslistToMap };
