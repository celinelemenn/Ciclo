class CountryJob < ApplicationJob
  queue_as :default

  def perform(poi_id)
     puts "I'm starting the fake job"
    sleep 3
    puts "OK I'm done now"
  end
end
