import { initMapbox } from '../plugins/mapbox/init_mapbox';
import mapboxgl from 'mapbox-gl';

const geolocator = () => {

  const locateButton = document.querySelector(".btn-on-map-right");
  const options = { enableHighAccuracy: true };

  // The currentPosition function is called as the first argument of
  // the getCurrentPosition function and returns a Position object
  // which contains a coordinates object.

  const currentPosition = (position) => {
    const userCoordinates = position.coords
    console.log(`Current Latitude : ${userCoordinates.latitude}`);
    console.log(`Current Longitude: ${user.Coordinates.longitude}`);
    console.log(`Current Accuracy: ${userCoordinates.accuracy} meters.`);
    console.log(userCoordinates);
  }

  // The function below is optional and holds an error message. It is an option
  // argument of the getCurrentPosition function.

  const error = (error) => {
    console.warn(`ERROR(${error.code}): ${error.message}`);
  }

  // The condition below only runs the getCurrentPosition function
  // if the locator button is present AND the browser is capable of using
  // geolocation.

  if (locateButton && navigator.geolocation) {
    locateButton.addEventListener("click", (event) => {
      event.preventDefault();
      navigator.geolocation.getCurrentPosition(currentPosition, error, options);
    });
  } else {
    alert(`Error: ${error} Unable to access location`)
  }
};

    // Below is test code for adding a marker to the current position

    //     console.log(currentUserPosition);
    //     // const currentPositionMarker = document.createElement('div');
    //     // currentPositionMarker.className = 'current-position-marker';

    //     // new mapboxgl.Marker(currentPositionMarker)
    //     // const map = document.querySelector("#map");
    //     //   .setLngLat([ currentUserPosition.long, currentUserPosition.lat ]);
    //     //   .addTo(map);
    //   })


export { geolocator };