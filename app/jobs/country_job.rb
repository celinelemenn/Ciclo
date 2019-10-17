class CountryJob < ApplicationJob
  queue_as :default

  def perform
    @pois = PointOfInterest.where(country_name: nil)

    unless @pois.empty? || @pois.nil?
      @pois.each do |poi|
        puts "Found poi #{poi.id}"
        poi.country_name = Geocoder.search([poi.lat, poi.long]).first.country
        puts "found the country #{poi.country_name} for poi with lat:#{poi.lat}. long:#{poi.long}"
        poi.save
        puts "poi saved with country name"
      end
    end
  end
end
