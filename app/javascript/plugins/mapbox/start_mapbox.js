import mapboxgl from "mapbox-gl";
import { addPoisToMap } from "./add_pois_to_map";
import { addCyslistToMap } from "./add_cyclist_to_map";
import { getPosition } from "./get_current_position";
import { createPopdown } from "./create_popdown";

export const startMap = () => {
  const mapElement = document.getElementById("map");

  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const userPositionElement = document.getElementById("map").dataset
    .userPosition;

  const center = JSON.parse(userPositionElement)
    ? [
        JSON.parse(userPositionElement)[0].long,
        JSON.parse(userPositionElement)[0].lat,
      ]
    : [4.807, 45.197];

  // mount the map
  const map = new mapboxgl.Map({
    container: "map",
    style: "mapbox://styles/klingmap/ck027tg7x04481cmu8e9wvrud",
    center: center,
    zoom: 8,
  });

  // add localization button
  const geolocate = new mapboxgl.GeolocateControl({
    positionOptions: {
      enableHighAccuracy: true,
    },
    trackUserLocation: true,
  });

  // add on click on the map > create POI
    map.on("click", (event) => {
        const popdown = document.querySelector(".popdown");
        if (!popdown.classList.value.includes('popdown-visible')) {

          // add market where clicked
          const marker = new mapboxgl.Marker()
            .setLngLat([event.lngLat.lng, event.lngLat.lat])
            .addTo(map);

          // add pop up
          const info_window = JSON.parse(mapElement.dataset.popUpAddPoi);
          createPopdown(info_window, marker);

          // add lat - long in pop up info and link params
          const text = document.querySelector(".distance_km .detail");
          text.innerText =
            text.innerText +
            " lat " +
            Math.round(event.lngLat.lat * 100) / 100 +
            "- long " +
            Math.round(event.lngLat.lng * 100) / 100;

          const link = document.querySelector(".info_window_popdown_btn a");
          link.href =
            link.href +
            "?" +
            "lat=" +
            event.lngLat.lat +
            "&lng=" +
            event.lngLat.lng;
        }
    });


// add geolocate button on map
  map.addControl(geolocate, "bottom-right");

  // add poi to the map
  const markers = JSON.parse(mapElement.dataset.markers);
  addPoisToMap(map, markers);

  // add cyclists to the map
  const cyclists = JSON.parse(mapElement.dataset.cyclists);
  addCyslistToMap(map, cyclists);

  // ask for geoloc on load
  getPosition(map);

  // alert raised if click on plus and no geolocation otherwise getPosition and direct to poi new
  const plusButton = document.querySelector(".btn-on-map-left a");
  plusButton.addEventListener("click", (event) => {
    getPosition(map);
  });
};
