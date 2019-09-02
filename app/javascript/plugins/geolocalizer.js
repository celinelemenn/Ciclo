import { initMapbox } from '../plugins/mapbox/init_mapbox';
import mapboxgl from 'mapbox-gl';
import { map } from './mapbox/init_mapbox.js';
import currentMarker from '../../assets/images/current_marker.png'

const locateButton = document.querySelector(".btn-on-map-right");
const options = { enableHighAccuracy: true };
const userCurrentPosition = [];

// The currentPosition function is called as the first argument of
// the getCurrentPosition function and returns a Position object
// which contains a coordinates object.

const currentPosition = (position) => {
  const userCoordinates = position.coords
  // console.log(`Current Latitude : ${userCoordinates.latitude}`);
  // console.log(`Current Longitude: ${userCoordinates.longitude}`);
  // console.log(`Current Accuracy: ${userCoordinates.accuracy} meters.`);
  // console.log(`Starting Position: Lat: ${userCoordinates.latitude} Long: ${userCoordinates.longitude}`);
}

// The function below is optional and holds an error message. It is an option
// argument of the getCurrentPosition function.

const error = (error) => {
  console.warn(`ERROR(${error.code}): ${error.message}`);
}

// Below is the function to watch a user's position

const watchUserPosition = (position) => {
  const watchedCoordinates = position.coords
  const currentPosition = {
    latitude: watchedCoordinates.latitude,
    longitude: watchedCoordinates.longitude
  }
  userCurrentPosition.push(currentPosition);

  localize();
}

const localize = () => {
  if (locateButton && navigator.geolocation) {

    locateButton.classList.toggle("btn-on-map-right-rotate");

    const { latitude, longitude } = userCurrentPosition[userCurrentPosition.length-1]
    console.log("User Current Position:", latitude, longitude)

    const currentMarkerGeojson = {
      "type": "FeatureCollection",
      "features": [{
        "type": "Feature",
        "geometry": {
          "type": "Point",
          "coordinates": [longitude, latitude]
        }
      }]
    };

    const sourceName = `current_position_${userCurrentPosition.length}`

    map.addSource(sourceName, {
      "type": "geojson",
      "data": currentMarkerGeojson
    });

    map.addLayer({
      "id": `current_position_layer_${userCurrentPosition.length}`,
      "type": "circle",
      "source": sourceName,
      "paint": {
        "circle-radius": 10,
        "circle-color": "#26547C",
        "circle-stroke-width": 3,
        "circle-stroke-color": "#fff"
      }
    })
    fetch('/api/v1/user_positions', {
      method: 'POST',
      body: JSON.stringify({
        user_position: {
          lat: latitude,
          long: longitude
        }
      })
    }).then((response) => {
      return response.json();
    }).then((data) => {
      console.log(data);
    });
}}

// The condition below only runs the getCurrentPosition function
// if the locator button is present AND the browser is capable of using
// geolocation.
const geolocator = () => {
  window.addEventListener("load", (event) => {
    console.log("This works");
    navigator.geolocation.getCurrentPosition(currentPosition, error, options);
    navigator.geolocation.watchPosition(watchUserPosition);

  });
}

export { geolocator };
