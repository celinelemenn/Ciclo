import mapboxgl from 'mapbox-gl';
import { addPoisToMap } from '../../plugins/mapbox/add_pois_to_map';
import { createPopdown  } from '../../plugins/mapbox/create_popdown';
import { addCyslistToMap } from '../../plugins/mapbox/add_cyclist_to_map';
import { api_execute } from '../../plugins/mapbox/api_functions';
import { processData } from '../../plugins/mapbox/api_functions';



const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/klingmap/ck026un5s58d51co0xymdhlac',
    center: [4.925,52.375],
    zoom: 10,
  });
};

export const map = buildMap();


const initMapbox = () => {

  if (mapElement) {

    //pois on map
    const markers = JSON.parse(mapElement.dataset.markers);
    addPoisToMap(map, markers);

    //cyclist on map
    const cyclists = JSON.parse(mapElement.dataset.cyclists);
    addCyslistToMap(map, cyclists);


    // location
    // map.addControl(new mapboxgl.GeolocateControl({
    //   positionOptions: {
    //   enableHighAccuracy: true
    //   },
    //   trackUserLocation: true
    //   }));


  }
};
// ********************end*mapbox********************************** //


// API functions
const run_mapbox_page = async () => {
  const poi_array = await processData();
  initMapbox(poi_array);
}

export { run_mapbox_page };

