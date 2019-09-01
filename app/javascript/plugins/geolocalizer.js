import { initMapbox } from '../plugins/mapbox/init_mapbox';
import mapboxgl from 'mapbox-gl';

const geolocator = () => {

  const locateButton = document.querySelector(".btn-on-map-right");

  locateButton.addEventListener("click", (event) => {

    event.preventDefault();

    navigator.geolocation.getCurrentPosition((data) => {
      console.log(data);
      const currentUserPosition = {
        lat: data.coords.latitude,
        long: data.coords.longitude
      }
      console.log(currentUserPosition.lat);
      // const currentPositionMarker = document.createElement('div');
      // currentPositionMarker.className = 'current-position-marker';

      // new mapboxgl.Marker(currentPositionMarker)
      // const map = document.querySelector("#map");
      //   .setLngLat([ currentUserPosition.long, currentUserPosition.lat ]);
      //   .addTo(map);
    })
  });
}

export { geolocator };
