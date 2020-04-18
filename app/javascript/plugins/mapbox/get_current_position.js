// function for sucess getCurrentPosition
const success = (position) => {
  const watchedCoordinates = position.coords;
  const currentPosition = {
    latitude: watchedCoordinates.latitude,
    longitude: watchedCoordinates.longitude,
  };
  userCurrentPosition.push(currentPosition);

  map.flyTo({
    center: [currentPosition.longitude, currentPosition.latitude],
    zoom: 10,
  });
};

// options for getCurrentPosition
const options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0,
};

// errors for getCurrentPosition
const error = (error) => {
  const banner = document.querySelector("#geoloc-banner");
  const message = document.querySelector(".geoloc-message");
  let locale = document.querySelector(".uni-app-container").dataset.locale;

  banner.style.display = "block";
  
  if (error.code !== 1) {
    message.innerHTML = I18n.t("geolocalization.message_3", {
      locale: locale || "en",
    });
  }

  const close = document.querySelector(".closing-geoloc-message");
  close.addEventListener("click", (event) => {
    banner.style.display = "none";
  });
};

export const getPosition = () => {
navigator.geolocation.getCurrentPosition(success, error, options);

}
