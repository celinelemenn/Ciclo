# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying previous seeds"

Report.destroy_all
puts "> Report table destroyed"

Bookmark.destroy_all
puts "> Bookmark table destroyed"

Comment.destroy_all
puts "> Comment table destroyed"

Like.destroy_all
puts "> Like table destroyed"

Downvote.destroy_all
puts "> Downvote table destroyed"

PointOfInterest.destroy_all
puts "> PointOfInterest table destroyed"

Trip.destroy_all
puts "> Trip table destroyed"

Preference.destroy_all
puts "> Preference table destroyed"

UserPosition.destroy_all
puts "> UserPosition table destroyed"

User.destroy_all
puts "> User table destroyed"

puts "Seeds Destroyed"


puts "Creating test users"

test_user = User.create(
  email: "maria_lopez@gmail.com",
  password: "1234567",
  full_name: "Maria Lopez",
  remote_photo_url: 'https://images.unsplash.com/photo-1567303314286-6735a4ad9d42?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=703&q=80',
  bio: "🚲Travelling half world by 🚲 and keep riding.
  25000KM | 20 MONTHS |
📍current location: NORWAY",
  description: "Being around the world with my bikie 🌏: I love travelling, bikes and cats.",
  blog: "https://mariatravells.com/",
  terms: true,
)

puts "> test_user created"

test_user2 = User.create(
  email: "johnTeagan2@gmail.com",
  password: "1234567",
  full_name: "John McCallister",
  remote_photo_url: 'https://images.unsplash.com/photo-1547404415-5eb20ddab016?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  bio: "John and Teagan 🇦🇺Australians
touring by 🚴‍♂️🚴‍♀️ Malaysia to England🏕.",
  description: "Being around the world with my bikie 🌏: Our trip; 19 Countries, 14000kms.
📍: Currently in Iran",
  blog: "https://johnTeagan.com/",
  terms:true,
)


test_user3 = User.create(
  email: "fatima@gmail.com",
  password: "1234567",
  full_name: "Fatima van Dyke",
  remote_photo_url: "https://images.unsplash.com/photo-1510191240544-c9de9dd0baed?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  bio: "I love being a nomad. Currently writing a book for my adventures in foreign lands." ,
  description: " I did my cycling record in Norway, 16000kms.
📍: Currently taking a break 😴",
  blog: "https://fatimalog.com/",
  terms:true,
)

test_user4 = User.create(
  email: "johannes2@gmail.com",
  password: "1234567",
  full_name: "Johannes Smith",
  remote_photo_url: "https://images.unsplash.com/photo-1566847773902-a9e01bdfb71b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80",
  bio: "Johannes: German traveller:
touring by 🚴‍♂️🚴‍♀️.",
  description: "My dream is to travel the world with my bike.
📍: Currently in Greece 🌊",
  blog: "https://johannesthegerman.com/",
  terms:true,
)

test_user5 = User.create(
  email: "teresa@gmail.com",
  password: "1234567",
  full_name: "Teresa Mendossa",
  remote_photo_url: "https://images.unsplash.com/photo-1533407411655-dcce1534c1a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  bio: "I am from Mexico and I love good food and good stories.
touring by 🚴‍♂️🚴‍♀️ in warm exotic places.",
  description: "Around the globe 🌏: My trip; 2 Countries, 14000kms.
📍: Currently in Italy 🥐🍷",
  blog: "https://teresita.com/",
  terms:true,
)

puts "> Individual user created"
puts "> We have now #{User.count} test user created"

# ----- Add location to users----

puts "Creating one user position for each users"


user_positions = [
[4.63311798318442136, 52.22781546461253299],
[4.8701169194470566, 52.31378997455897206],
[4.84259835508827674, 52.3736725900286757],
[4.68950668383535962, 52.33127787360739092],
[4.88394770134858103, 52.45599899604990668],
[4.60803550886977398, 52.09078574306185061]
]

users = User.all

user_positions.each_with_index do |position, index|

UserPosition.create(
  lat: position[1],
  long: position[0],
  user: users[index]
  )
end

p UserPosition.all


puts "> We have now 1 location for each user. We have created #{UserPosition.count} locations"

# ----- Point of interest seedings for map----
puts "creating PointOfInterest seeds..."

set_of_geolocations_water_refill = [

[4.35837897597332535, 52.0119227152636227],
[4.29968781740753414, 51.6794523786636617],
[4.15029462176751274, 51.7264302469553172],
[4.57788263261238448, 51.8149640959489445],
[4.39000596494880568, 51.8256325388390948],
[4.83994753213944406, 52.46040916603296012],
[4.82537860478253577, 52.38189882833366795],
[4.86457660305994466, 52.35196893253793604],
[4.82310150454673181, 52.35732502875396221],
[4.76874077326959966, 52.35784584369549322],
[4.94489780514377664, 52.34239193155135439],
[4.89550742510102577, 52.363194387901423],
[4.916496752117677, 52.33673590780477269]

]

set_of_geolocations_camping = [

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
[4.56900393092186707, 52.27620700091733852],
[4.92595787795585061, 52.1802584499173463],
[4.88581422977020541, 52.2455065521940369]

]

set_of_geolocations_caution = [

[5.06325580736216452, 52.2679297193631669],
[4.83576844797387384, 52.1435312545463602],
[4.71341357789167059, 52.1622775857439435],
[4.52827947904445693, 52.1610751488974671],
[4.61451708701746899, 52.1858987198268948],
[4.69656959501611748, 52.2324385457821662],
[4.79686864937800461, 52.4049887872492021],
[4.57943139992635917, 52.3819018099081077],
[4.52077793012683937, 52.1416381831231063],
[4.42412640923861122, 52.0585129422366890],
[4.6557955627184997 ,52.07229298700148945],
[4.52442657650137292, 51.9526862451945419],
[4.57385843386091029, 52.0378368367808334],
[4.31699019297709441, 51.9364439473919787],

]

set_of_geolocations_landmark = [

[4.20538171600009747, 51.8578402420556372],
[4.24503269018832263, 51.9914941017116376],
[4.66176821834636801, 51.9463452042970388],
[4.65207310436278298, 52.29141180668530353],
[4.68356031167621811, 52.38391429230023988],
[4.86388983480058368, 52.30046259658358565],
[4.76758457046679673, 52.20887410283720698],
[4.74133384764018473, 52.32917439055052],
[4.73080857548744582, 52.0509299998066197],
[4.85629135170671855, 52.0733669067316711],
[4.80650354208736807, 51.9713766599526323],
[4.81482543258788098, 52.5480070116680622],
[4.79135602010192407, 52.8143590857821863],
[4.73535425387907338, 52.5475972997628133],
[5.07236926255011689, 52.0959464018374873],

]

# set_of_poitypes = [1, 2, 3, 4, 5]
poi_types = POINT_OF_INTEREST.values.map { |poi| poi[:label] }

# POINT_OF_INTEREST[poi2.poi_type.to_sym]


set_of_geolocations_water_refill.each_with_index do |item, index|

  PointOfInterest.create!(
    lat: set_of_geolocations_water_refill[index][1], # set_of_geolocations[index_geolocation][lat]
    long: set_of_geolocations_water_refill[index][0], # set_of_geolocations[index_geolocation][long]
    poi_type: :water_refill,
    description: "The fountain is behind a tree so it's not visible",
    title: 'Water fountain',
    user: users.sample,
    published: true,
    remote_photo_url: 'https://i.imgur.com/RE3wGZn.jpg'
    )
  end


set_of_geolocations_camping.each_with_index do |item, index|
  PointOfInterest.create!(
    lat: set_of_geolocations_camping[index][1], # set_of_geolocations[index_geolocation][lat]
    long: set_of_geolocations_camping[index][0], # set_of_geolocations[index_geolocation][long]
    poi_type: :camping,
    description: "Nice campside not difficult to find. It's safe and other campers are always around",
    title: 'Nice campside point',
    user: users.sample,
    published: true,
    remote_photo_url: 'https://images.unsplash.com/photo-1511993807578-701168605ad3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1047&q=80'
    )
  end

set_of_geolocations_caution.each_with_index do |item, index|

PointOfInterest.create!(
    lat: set_of_geolocations_caution[index][1], # set_of_geolocations[index_geolocation][lat]
    long: set_of_geolocations_caution[index][0], # set_of_geolocations[index_geolocation][long]
    poi_type: :caution,
    description: 'Some rocks fell from the cliff and the road is not save for cycling.',
    title: 'Bad road',
    user: users.sample,
    published: true,
    remote_photo_url: 'https://images.unsplash.com/photo-1501967111356-35219aeb2ea1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
    )
end

set_of_geolocations_landmark.each_with_index do |item, index|

PointOfInterest.create!(
    lat: set_of_geolocations_landmark[index][1], # set_of_geolocations[index_geolocation][lat]
    long: set_of_geolocations_landmark[index][0], # set_of_geolocations[index_geolocation][long]
    poi_type: :landmark,
    description: 'Beautiful dutch windmill on the way',
    title: 'Windmill',
    user: users.sample,
    published: true,
    remote_photo_url: 'https://images.unsplash.com/photo-1563800037628-2b1bfb1876f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
    )
end

puts "> #{PointOfInterest.count} PointOfInterest created "


# -----------

puts "Creating trips for test_user....."


# users.each do |user|

#     trip1 = Trip.create(
#      start_date: DateTime.parse("09/01/2019 17:00"),
#      end_date: DateTime.parse("09/01/2020 19:00"),
#      name: "Cycling the South East of Asia",
#      km: 30022,
#      remote_photo_url: "https://images.unsplash.com/photo-1494919027819-5b2cb8994d5d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
#      blog: "www.mylife.com",
#      user: test_user
#      )

# end
trip1 = Trip.create(
   start_date: DateTime.parse("09/02/2019 17:00"),
   end_date: DateTime.parse("09/03/2020 19:00"),
   name: "Cycling through USA",
   km: 20100,
   remote_photo_url: "https://images.unsplash.com/photo-1530959106156-50f49c30932d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
   user: test_user
   )

trip1 = Trip.create(
   start_date: DateTime.parse("09/01/2019 17:00"),
   end_date: DateTime.parse("16/02/2020 19:00"),
   name: "Cycling through Southern France",
   km: 12000,
   remote_photo_url: "https://images.unsplash.com/photo-1459159104669-bdbee375caa7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=988&q=80",
   user: test_user
   )

trip1 = Trip.create(
   start_date: DateTime.parse("09/11/2019 17:00"),
   end_date: DateTime.parse("15/11/2020 19:00"),
   name: "Cycling through Mexico",
   km: 20100,
   remote_photo_url: "https://images.unsplash.com/photo-1518105779142-d975f22f1b0a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
   user: test_user2
   )

trip1 = Trip.create(
   start_date: DateTime.parse("09/01/2019 17:00"),
   end_date: DateTime.parse("09/02/2020 19:00"),
   name: "Cycling through Switzerland",
   km: 12000,
   remote_photo_url: "https://images.unsplash.com/photo-1527095655060-4026c4af2b25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
   user: test_user2
   )

trip1 = Trip.create(
   start_date: DateTime.parse("09/02/2019 17:00"),
   end_date: DateTime.parse("09/03/2020 19:00"),
   name: "Cycling through Norway",
   km: 16000,
   remote_photo_url: "https://images.unsplash.com/photo-1506701160839-34cfdecaf53c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
   user: test_user3
   )

trip1 = Trip.create(
   start_date: DateTime.parse("09/06/2019 17:00"),
   end_date: DateTime.parse("09/08/2020 19:00"),
   name: "Cycling through Colombia",
   km: 12000,
   remote_photo_url: "https://images.unsplash.com/photo-1536308037887-165852797016?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1012&q=80",
   user: test_user3
   )

trip1 = Trip.create(
   start_date: DateTime.parse("09/02/2019 17:00"),
   end_date: DateTime.parse("09/03/2020 19:00"),
   name: "Cycling through Marocco",
   km: 20100,
   remote_photo_url: "https://images.unsplash.com/photo-1562790933-8ff229db810e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
   user: test_user4
   )

trip1 = Trip.create(
   start_date: DateTime.parse("09/01/2019 17:00"),
   end_date: DateTime.parse("09/02/2020 19:00"),
   name: "Cycling through Belgium",
   km: 12000,
   remote_photo_url: "https://images.unsplash.com/photo-1491557345352-5929e343eb89?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
   user: test_user4
   )

trip1 = Trip.create(
   start_date: DateTime.parse("09/03/2019 17:00"),
   end_date: DateTime.parse("01/05/2020 19:00"),
   name: "Cycling through Cyprus",
   km: 20100,
   remote_photo_url: "https://images.unsplash.com/photo-1560860432-f5c0f302f20f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=968&q=80",
   user: test_user5
   )

trip1 = Trip.create(
   start_date: DateTime.parse("09/04/2019 17:00"),
   end_date: DateTime.parse("09/05/2020 19:00"),
   name: "Cycling through Eastern Europe",
   km: 12000,
   remote_photo_url: "https://images.unsplash.com/photo-1551818176-60579e574b91?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
   user: test_user5
   )

puts ">#{Trip.count} trips created"

#-------------adding votes to the last POI ONLY (not all POI)--------------

puts "Creating likes and downvotes for the last POI from test_user4 ...."

5.times do
  Like.create(
    point_of_interest_id: PointOfInterest.last.id,
    user_id: test_user.id
    )
end

3.times do
  Downvote.create(
    point_of_interest_id: PointOfInterest.last.id,
    user_id: test_user.id
    )
end

puts " > #{Like.count} likes #{Downvote.count} downvotes created"

#-------------adding comments to the last POI ONLY (not all POI)--------------

puts "Creating comments for the last POI from test_user...."

pois = PointOfInterest.all

pois.each do |poi|
    Comment.create(
      point_of_interest_id: poi.id,
      user_id: users.sample.id,
      content: 'This point is still up to date. Made our trip easier ✔️'
      )

    Comment.create(
      point_of_interest_id: poi.id,
      user_id: users.sample.id,
      content: 'Very useful information for our long trip. Thanks to the community and Ciclo 😎'
      )

    Comment.create(
      point_of_interest_id: poi.id,
      user_id: users.sample.id,
      content: 'Great info guys! Thanks for that 😊'
      )
end

puts "> #{Comment.count} comments created"
