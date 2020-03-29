const api_execute = async () => {
  const poiApiEndpoint =
    `${window.location.origin}` + `/api/v1/point_of_interests`; //to avoid getting http://localhost:3000/api/v1/point_of_interests on heroku
  let response = await fetch(poiApiEndpoint);
  let data = await response.json();
  return data;
};

const processData = async () => {
  let objects = [];
  let data = await api_execute();
  data.forEach(poi => {
    const temp_obj = new Object();
    temp_obj.id = poi["id="];
    temp_obj.lat = poi["lat="];
    temp_obj.long = poi["long="];
    temp_obj.poiType = poi["poi_type="];
    temp_obj.markerLink = poi["marker_icon="];
    objects.push(temp_obj);
  });
  return objects;
};

export { api_execute };
export { processData };
