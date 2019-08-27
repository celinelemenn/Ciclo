import mapboxgl from 'mapbox-gl';
import { point_of_interests_on_map } from 'point_of_interests_on_map';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

     // initialise map
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/klingmap/cjztq9yns04ke1dny5m5o49bz',
      center: [4.925,52.375],
      zoom: 10,
    });

    // drawing markers on the map - simple version
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);

    });


    // drawing custom markers for POIS
    pooiMarkersOnMap();



    console.log(markers);


  }
};

export { initMapbox };
