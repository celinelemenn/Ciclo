import mapboxgl from "mapbox-gl";
import { addPoisToMap } from "./add_pois_to_map";
import { addCyslistToMap } from "./add_cyclist_to_map";
import { getPosition } from "./get_current_position";

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
    trackUserLocation: false,
    fitBoundsOptions: {
      maxZoom: 13,
    },
  });

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
