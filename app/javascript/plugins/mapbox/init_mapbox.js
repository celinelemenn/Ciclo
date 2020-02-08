import mapboxgl from 'mapbox-gl';
import { addPoisToMap } from '../../plugins/mapbox/add_pois_to_map';
import { createPopdown  } from '../../plugins/mapbox/create_popdown';
import { addCyslistToMap } from '../../plugins/mapbox/add_cyclist_to_map';
import { api_execute } from '../../plugins/mapbox/api_functions';
import { processData } from '../../plugins/mapbox/api_functions';
// import { addCurrentPositionToMap } from '../../plugins/mapbox/add_current_position_to_map';


const mapElement = document.getElementById('map');


const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const userPositionElement = document.getElementById('map').dataset.userPosition;

  let center = (JSON.parse(userPositionElement)) ? [JSON.parse(userPositionElement)[0].long, JSON.parse(userPositionElement)[0].lat] : [4.834277, 45.763420];

  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/klingmap/ck027tg7x04481cmu8e9wvrud',
    center: center,
    zoom: 8,
  });
};

export const map = mapElement ? buildMap() : null;

const initMapbox = () => {

  if (mapElement) {

    //pois on map
    const markers = JSON.parse(mapElement.dataset.markers);
    addPoisToMap(map, markers);

    //cyclist on map
    const cyclists = JSON.parse(mapElement.dataset.cyclists);
    addCyslistToMap(map, cyclists);




  }
};

// API functions
const run_mapbox_page = async () => {
  const poi_array = await processData();
  initMapbox(poi_array);
}

export { run_mapbox_page };

