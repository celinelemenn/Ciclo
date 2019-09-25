import { initMapbox } from '../plugins/mapbox/init_mapbox';
import mapboxgl from 'mapbox-gl';
import { map } from './mapbox/init_mapbox.js';

const locateButton = document.querySelector(".btn-on-map-right");
const mapElement = document.getElementById("map");

// The options below are passed to the

const options = {
  maximumAge: 120000,
  enableHighAccuracy: true,
  timeout: 10 * 1000
};
const userCurrentPosition = [];

// The currentPosition function is called as the first argument of the getCurrentPosition function
// and returns a Position object which contains a coordinates object.

const currentPosition = (position) => {
  const userCoordinates = position.coords;
}

// The function below is optional and holds an error message. It is an optional argument of the
// getCurrentPosition/watchPosition functions.

const error = (error) => {
    console.warn(`ERROR(${error.code}): ${error.message}`);
    const message = document.querySelector('#geoloc-banner');
    message.style.display = "block"  ;
    if (error.code == 1) {
    message.innerHTML = "<h5> <strong>WARNING:</strong> We don't have permission to use your localization. </h5>" + message.innerHTML;
     } else {
      message.innerHTML = "<h5> <strong>WARNING:</strong> An error occured and we could not access your localization.</h5> <p>Please reload the page and try again.</p> "
     }
}

// Below is the function to watch a user's position. It is called as the first argument of the
// watchPosition function.

const watchUserPosition = (position) => {
  // console.log('hola') - For testing
  const watchedCoordinates = position.coords
  const currentPosition = {
    latitude: watchedCoordinates.latitude,
    longitude: watchedCoordinates.longitude
  }
    console.log(watchedCoordinates);
  userCurrentPosition.push(currentPosition);

  // The localize() function checks whether the map is present before running.

  localize();
}

// The if condition below implements the logic for the locate button on the map.

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
    // console.log("User Current Position:", latitude, longitude)

    // Below, we build the marker and add it to the map. We use a png image which prevents the
    // marker from being propagated at one point. Check Add Icon to Map in Mpabox documentation.

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

    // Below we post to our user_positions API so that they are stored in the user_position table

    const axios = require('axios');

    axios.post('/api/v1/user_positions', {
      user_position: {
        lat: latitude,
        long: longitude
      }
    })
    .then((data) => {
      // console.log(data)
    })

    // API-build ends here (axios is an alternative to fetch, it is a package)
  }
}

// The condition below only runs the getCurrentPosition function if the locator button is present
// AND the browser is capable of using geolocation through the localze() function above.

const geolocator = () => {
  if (mapElement) {
    window.addEventListener("load", (event) => {
      console.log("This works");
      // navigator.geolocation.getCurrentPosition(currentPosition, error, options);
      navigator.geolocation.watchPosition(watchUserPosition, error, options);
    });
  }
}

export { geolocator };
