import mapboxgl from 'mapbox-gl';
import { campingGeojson } from '../../plugins/mapbox/campsites';
import { map } from '../../plugins/mapbox/init_mapbox';

const addCampingsToMap = () => {

  const geojson = campingGeojson();

  map.on('load', function() {

      map.addSource('campings', {
          "type": "geojson",
          "data": geojson
      });

      map.addLayer({
          "id": "campings",
          "type": "fill",
          "source": "campings",
          'paint': {
            'fill-color': '#F6CD03',
            'fill-opacity': 0.8
            }
      });

      map.on('click', 'campings', function (e) {
      new mapboxgl.Popup()
          .setLngLat(e.lngLat)
          .setHTML(e.features[0].properties.naamnl)
          .addTo(map);
      });
  });


};

export { addCampingsToMap };







