// const new_location = () => {
//   document.addEventListener('DOMContentLoaded', (event) => {
//     console.log('getting location')
//     if (navigator.geolocation) {
//       navigator.geolocation.getCurrentPosition(insert_location);
//     } else {
//       console.log("This browser does not support geoLocating!")
//     }
//   })
// }

// const insert_location = (position) => {
//   const new_poi_form = document.getElementById("new-poi-form")
//   console.log(position);
//   new_poi_form.insertAdjacentHTML('beforeend', `<input type="hidden" name="lat" value="${position.coords.latitude}">`)
//   new_poi_form.insertAdjacentHTML('beforeend', `<input type="hidden" name="long" value="${position.coords.longitude}">`)
// }

// export { new_location };
