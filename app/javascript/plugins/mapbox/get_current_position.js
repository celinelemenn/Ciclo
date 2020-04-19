// function for sucess getCurrentPosition
const success = (position, map) => {
  const coordinates = position.coords;
  const axios = require("axios");

  axios
    .post("/api/v1/user_positions", {
      user_position: {
        lat: coordinates.latitude,
        long: coordinates.longitude,
      },
    })
    .then((data) => {
      // console.log(data);
    });

  map.flyTo({
    center: [coordinates.longitude, coordinates.latitude],
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
const errorfunction = (error) => {
  const banner = document.querySelector("#geoloc-banner");
  const message = document.querySelector(".geoloc-message");
  let locale = document.querySelector(".uni-app-container").dataset.locale;

  banner.style.display = "block";

  if (error.code === 1) {
    const plusButton = document.querySelector(".btn-on-map-left a");
    plusButton.addEventListener("click", (event) => {
      event.preventDefault();
      banner.style.display = "block";
    });
  }

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

export const getPosition = (map, event) => {
  navigator.geolocation.getCurrentPosition(
    (position) => {
      success(position, map);
    },
    (error) => {
      errorfunction(error);
    },
    options
  );
};
