class NewPoiCountryNameJob < ApplicationJob
  queue_as :default

  def perform(poi_id)
    if poi_id
      poi = PointOfInterest.find(poi_id)
      puts "Create - Found poi id:#{poi.id}"
      poi.country_name = Geocoder.search([poi.lat, poi.long]).first.country
      puts "Create - found the country #{poi.country_name} for poi with lat:#{poi.lat}. long:#{poi.long}"
      poi.save
      puts "Created poi saved with country name"
    end
  end
end
