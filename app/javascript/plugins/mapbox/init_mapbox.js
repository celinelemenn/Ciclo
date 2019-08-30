import mapboxgl from 'mapbox-gl';
import { poiGeojson } from '../../plugins/mapbox/poi_geojson';
import { createPopdown  } from '../../plugins/mapbox/create_popdown';
const geojson =  poiGeojson();

//**FETCHING JSON DATA FROM API LINE BY LINE AND CONVERT IT**//

const api_execute = async () => {
  const poiApiEndpoint = `${window.location.origin}` + `/api/v1/point_of_interests`   //to avoid getting http://localhost:3000/api/v1/point_of_interests on heroku
  let response = await fetch(poiApiEndpoint)
  let data = await response.json()
  return data
}

const processData = async () => {
  let objects = [];
  let data = await api_execute();
  // console.log(data);
  data.forEach((poi) => {
    const temp_obj = new Object;
    temp_obj.id = poi['id='];
    temp_obj.lat = poi['lat='];
    temp_obj.long = poi['long='];
    temp_obj.poiType = poi['poi_type=']
    temp_obj.markerLink = poi['marker_icon='];
    objects.push(temp_obj);
   })
  return objects;
}
// ********************end*fetching********************************** //


//**** MAPBOX _ INITIALISE AND DATA ON MAP*****//

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    //--- initialise map --- //
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/klingmap/cjztq9yns04ke1dny5m5o49bz',
      center: [4.925,52.375],
      zoom: 10,
    });


    // ----------------------//

    // Gets Users location

    // map.addControl(new mapboxgl.GeolocateControl({
    //   positionOptions: {
    //     enableHighAccuracy: true
    //   },
    //   trackUserLocation: true
    // }));


    // --- POI's as markers --- //
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const el = document.createElement('div'); // create a DOM element for the marker
      el.className = 'marker poi-icon';
      const url = marker.marker_link;
      el.style.backgroundImage = `url(${url})`;
      el.style.width = '30px';
      el.style.height = '30px';
      // console.log(marker)

      // drop down
      el.addEventListener('click', function() {
        createPopdown(marker.infoWindow);
      });

      new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);

    });

    // cyclist on map
    const cyclists = JSON.parse(mapElement.dataset.cyclists);
    cyclists.forEach((cyclist) => {
      const el = document.createElement('div');
      el.className = 'marker cyclist-avatar';
      const url = 'https://i.imgur.com/dEwa4Bt.png';
      el.style.backgroundImage = `url(${url}`;
      el.style.width = '50px';
      el.style.height = '50px';

      el.addEventListener('click', function() {
        const url = `${window.location.origin}${cyclist.user_link}`
        console.log(url);
        window.location = url
      });



      new mapboxgl.Marker(el)
        .setLngLat([cyclist.lng, cyclist.lat])
        .addTo(map);
    });


    // location
    // map.addControl(new mapboxgl.GeolocateControl({
    //   positionOptions: {
    //   enableHighAccuracy: true
    //   },
    //   trackUserLocation: true
    //   }));


  // --- picture example custom markers  -- //
    geojson.features.forEach(function(object) {
      var el = document.createElement('div');
      el.className = 'marker';
      el.style.backgroundImage = 'url(https://placekitten.com/g/' + object.properties.iconSize.join('/') + '/)';
      el.style.width = object.properties.iconSize[0] + 'px';
      el.style.height = object.properties.iconSize[1] + 'px';

      new mapboxgl.Marker(el)
          .setLngLat(object.geometry.coordinates)
          .addTo(map);
    });


  }
};
// ********************end*mapbox********************************** //



const run_mapbox_page = async () => {
  const poi_array = await processData();
  initMapbox(poi_array);
}

export { run_mapbox_page };
