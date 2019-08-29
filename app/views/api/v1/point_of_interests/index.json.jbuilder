json.array! @poi do |poi|
  json.id = poi[:poi].id
  json.lat = poi[:poi].lat
  json.long = poi[:poi].long
  json.poi_type = poi[:poi].poi_type
  json.marker_icon = poi[:marker_link]
end
