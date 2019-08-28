# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying previous seeds"
PointOfInterest.destroy_all
User.destroy_all

puts "Seeds Destroyed"


puts "Creating test user"

test_user = User.create(
  email: "test_user@gmail.com",
  password: "1234567",
  full_name: "Test McTest",
  remote_photo_url: 'https://i.pravatar.cc/60',
  bio: "Currently travelling in Asia",
  description: "Being around the world with my bikie",
  blog: "https://medium.com/",
)


test_user2 = User.create(
  email: "test_user2@gmail.com",
  password: "1234567",
  full_name: "Test McTest2",
  remote_photo_url: 'https://i.pravatar.cc/60',
  bio: "Currently travelling in Asia",
  description: "Being around the world with my bikie",
  blog: "https://medium.com/",
)

puts "Individual user created"
puts "We have now #{User.count} test user created"



# ----- Point of interest seedings for map----
puts "creeting PointOfInterest seeds..."

set_of_geolocations = [
[4.65207310436278298, 52.29141180668530353],
[4.68356031167621811, 52.38391429230023988],
[4.86388983480058368, 52.30046259658358565],
[4.76758457046679673, 52.20887410283720698],
[4.74133384764018473, 52.32917439055052],
[4.83994753213944406, 52.46040916603296012],
[4.82537860478253577, 52.38189882833366795],
[4.86457660305994466, 52.35196893253793604],
[4.82310150454673181, 52.35732502875396221],
[4.76874077326959966, 52.35784584369549322],
[4.81633586203921382, 52.32995622436212102],
[4.94489780514377664, 52.34239193155135439],
[4.89550742510102577, 52.363194387901423],
[4.916496752117677, 52.33673590780477269],
[4.87731917720219776, 52.31280284847873929],
[5.0439565697980786, 52.33043925268320606],
[4.95562037726580584, 52.30400233206035665],
[4.85837166827959255, 52.38403163776029459],
[4.7254108594312294, 52.39960653723696282],
[4.72470179996021855, 52.36038081736229088],
[4.69477850116895468, 52.32891108250812806],
[4.62423208266187302, 52.33243902997662644],
[4.66602594960226114, 52.34735999599211453],
[4.76802652469723842, 52.26988946845661133],
[4.63037180942266247, 52.23778899898901074],
[4.56900393092186707, 52.27620700091733852]
]

set_of_poitypes = [1, 2, 3, 4, 5]

set_of_geolocations.each_with_index do |item, index|
  PointOfInterest.create!(
    lat: set_of_geolocations[index][1], # set_of_geolocations[index_geolocation][lat]
    long: set_of_geolocations[index][0], # set_of_geolocations[index_geolocation][long]
    poi_type: set_of_poitypes.sample ,
    description: 'some poi description',
    user: test_user
    )
end

puts "#{PointOfInterest.count} PointOfInterest created "

#-----------

5.times.PastTrip.Create
