import { initMapbox } from '../plugins/mapbox/init_mapbox';
import mapboxgl from 'mapbox-gl';
import { map } from './mapbox/init_mapbox.js';
import currentMarker from '../../assets/images/current_marker.png'

const locateButton = document.querySelector(".btn-on-map-right");
const mapElement = document.getElementById("map");

const options = {
  maximumAge: 120000,
  enableHighAccuracy: true
};
const userCurrentPosition = [];

// The currentPosition function is called as the first argument of
// the getCurrentPosition function and returns a Position object
// which contains a coordinates object.

const currentPosition = (position) => {
  const userCoordinates = position.coords;
}

// The function below is optional and holds an error message. It is an option
// argument of the getCurrentPosition function.

const error = (error) => {
  console.warn(`ERROR(${error.code}): ${error.message}`);
}

// Below is the function to watch a user's position

const watchUserPosition = (position) => {
  // console.log('hola')
  const watchedCoordinates = position.coords
  const currentPosition = {
    latitude: watchedCoordinates.latitude,
    longitude: watchedCoordinates.longitude
  }
  userCurrentPosition.push(currentPosition);

  localize();
}

if (locateButton) {
  locateButton.addEventListener("click", (event) => {
    event.preventDefault();
    const { latitude, longitude } = userCurrentPosition[userCurrentPosition.length-1]
    locateButton.classList.toggle("btn-on-map-right-rotate");
    map.flyTo({
      center: [longitude, latitude],
      zoom: 12
    })
  })
}

const localize = () => {
  if (mapElement && navigator.geolocation) {

    const { latitude, longitude } = userCurrentPosition[userCurrentPosition.length-1]
    console.log("User Current Position:", latitude, longitude)

    // Below, we build the marker and add it to the
    map.loadImage('https://i.imgur.com/Vn4uERx.png', function(error, image) {
      if (error) throw error;
      map.addImage(`current_position_${userCurrentPosition.length}`, image);
      map.addLayer({
        "id": `current_position_layer_${userCurrentPosition.length}`,
        "type": "symbol",
        "source": {
          "type": "geojson",
          "data": {
            "type": "FeatureCollection",
            "features": [{
              "type": "Feature",
              "geometry": {
                "type": "Point",
                "coordinates": [longitude, latitude]
              }
            }]
          }
        },
        "layout": {
          "icon-image": `current_position_${userCurrentPosition.length}`,
          "icon-size": 0.04
        }
      });
    });

    // Below we post to our user_positions API

    const axios = require('axios');

    axios.post('/api/v1/user_positions', {
      user_position: {
        lat: latitude,
        long: longitude
      }
    })
    .then((data) => {
      console.log(data)
    })
  }
}

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
