import mapboxgl from 'mapbox-gl';
import { map } from '../../plugins/mapbox/init_mapbox';

const mapElement = document.getElementById('map');


const addCampingsToMap = () => {

const mapElement = document.getElementById('map');

 if (mapElement) {

  const geojson_campsites = require('./map_data/campsites.json')
  const geojson_campsites_points = require('./map_data/campsites_points.json')
  // console.log(geojson.features)

  map.on('load', function () {

    map.addSource('campings', {
      "type": "geojson",
      "data": geojson_campsites
    });

    map.addSource('campings_points', {
      "type": "geojson",
      "data": geojson_campsites_points
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


}



};

export { addCampingsToMap };







