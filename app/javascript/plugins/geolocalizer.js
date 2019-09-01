import { initMapbox } from '../plugins/mapbox/init_mapbox';

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
    })
      console.log(currentUserPosition.lat);

  });
}


export { geolocator };
