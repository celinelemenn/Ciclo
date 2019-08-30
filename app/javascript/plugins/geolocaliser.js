const addButton = document.querySelector(".btn-add");




const geoLocation = navigator.geolocation.getCurrentPosition((position) => {
  const lat = position.coords.latitude;
  const long = position.coords.longitude;
})

