import mapboxgl from "mapbox-gl";
import { addPoisToMap } from "./add_pois_to_map";
import { addCyslistToMap } from "./add_cyclist_to_map";

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

  // get position of the user
  const currentPosition = (position) => {
    // console.log('hola') - For testing
    const watchedCoordinates = position.coords;
    const currentPosition = {
      latitude: watchedCoordinates.latitude,
      longitude: watchedCoordinates.longitude,
    };
    userCurrentPosition.push(currentPosition);

    // center the map to this coordinate
    map.flyTo({
      center: [currentPosition.longitude, currentPosition.latitude],
      zoom: 10,
    });
  };

  const options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0,
  };

  const error = (error) => {
    const banner = document.querySelector("#geoloc-banner");
    const message = document.querySelector(".geoloc-message");
    let locale = document.querySelector(".uni-app-container").dataset.locale;

    banner.style.display = "block";
    if (error.code === 1) {

    } else {
      message.innerHTML = I18n.t("geolocalization.message_3", {
        locale: locale || "en",
      });
    }

    const close = document.querySelector(".closing-geoloc-message");
    close.addEventListener("click", (event) => {
      banner.style.display = "none";
    });
  };


  navigator.geolocation.getCurrentPosition(currentPosition, error, options);
};
