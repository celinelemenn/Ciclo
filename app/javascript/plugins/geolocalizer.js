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
    console.log('Array: ', userCurrentPosition)
    userCurrentPosition.push(currentPosition);

    // console.log(`Watched Coordinates Latitude : ${watchedCoordinates.latitude}`);
    // console.log(`Watched Coordinates Longitude: ${watchedCoordinates.longitude}`);
    // console.log(`Watched Coordinates Accuracy: ${watchedCoordinates.accuracy} meters.`);
    console.log(`Watched Position: Lat: ${watchedCoordinates.latitude} Long: ${watchedCoordinates.longitude}`);
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

  if (locateButton && navigator.geolocation) {
    locateButton.addEventListener("click", (event) => {
      event.preventDefault();

      locateButton.classList.toggle("btn-on-map-right-rotate");

      console.log("User Current Position:", userCurrentPosition)

      const currentMarkerGeojson = {
        "type": "FeatureCollection",
        "features": [{
          "type": "Feature",
          "geometry": {
            "type": "Point",
            "coordinates": [userCurrentPosition.longitude, userCurrentPosition.latitude]
          }
        }]
      };

      map.addSource("current_position", {
        "type": "geojson",
        "data": currentMarkerGeojson
      });

      map.addLayer({
        "id": "current_position",
        "type": "circle",
        "source": "current_position",
        "paint": {
          "circle-radius": 10,
          "circle-color": "#26547C",
          "circle-stroke-width": 3,
          "circle-stroke-color": "#fff"
        }
      })
    });
  }
}


export { geolocator };
