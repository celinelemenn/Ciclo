import mapboxgl from 'mapbox-gl';
import { campingGeojson } from '../../plugins/mapbox/campsites';
import { campingPointGeojson } from '../../plugins/mapbox/campsites_points';
import { map } from '../../plugins/mapbox/init_mapbox';

const addCampingsToMap = () => {

const geojson = campingGeojson();
const geojson_points = campingPointGeojson();

map.on('load', function () {

  map.addSource('campings', {
    "type": "geojson",
    "data": geojson
  });

  map.addSource('campings_points', {
    "type": "geojson",
    "data": geojson_points
  });


  const layers = map.getStyle().layers;
  // Find the index of the first symbol layer in the map style
  let firstSymbolId;
  for (let i = 0; i < layers.length; i++) {
      if (layers[i].type === 'symbol') {
          firstSymbolId = layers[i].id;
          break;
      }
  }

  map.addLayer({
      "id": "campings",
        "type": "fill",
        "source": "campings",
        'paint': {
          'fill-color': '#F6CD03',
          'fill-opacity': 1,
          'fill-outline-color': 'rgba(255,255,255, 1)',
          }
  }, firstSymbolId);

  map.addLayer({
    "id": "camping_points",
      "type": "circle",
      "source": "campings_points",
      "paint": {
            "circle-radius": 2,
            "circle-color": "#F6CD03"
        }
  }, firstSymbolId);


    map.on('click', 'campings', function (e) {
    new mapboxgl.Popup()
        .setLngLat(e.lngLat)
        .setHTML(e.features[0].properties.naamnl)
        .addTo(map);
    });
});



};

export { addCampingsToMap };







