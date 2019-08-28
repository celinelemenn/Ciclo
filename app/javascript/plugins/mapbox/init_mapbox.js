import mapboxgl from 'mapbox-gl';
import { poiGeojson } from '../../plugins/mapbox/poi_geojson';

const geojson =  poiGeojson();


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

    geojson.features.forEach(function(marker) {
    // create a DOM element for the marker
      var el = document.createElement('div');
      el.className = 'marker';
      el.style.backgroundImage = 'url(https://placekitten.com/g/' + marker.properties.iconSize.join('/') + '/)';
      el.style.width = marker.properties.iconSize[0] + 'px';
      el.style.height = marker.properties.iconSize[1] + 'px';

      el.addEventListener('click', function() {
          window.alert(marker.properties.message);
      });

      // add marker to map
      new mapboxgl.Marker(el)
          .setLngLat(marker.geometry.coordinates)
          .addTo(map);
    });


    console.log(markers);


  }
};

export { initMapbox };
