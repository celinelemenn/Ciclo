import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/klingmap/cjztq9yns04ke1dny5m5o49bz',
      center: [4.925,52.375],
      zoom: 10,
    });
  }
};

export { initMapbox };