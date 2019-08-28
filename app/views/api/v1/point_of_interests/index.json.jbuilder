json.array! @poi do |poi|
  json.id = poi[:poi].id
  json.lat = poi[:poi].lat
  json.long = poi[:poi].long
  json.marker_icon = poi[:marker_link]
end
