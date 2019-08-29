# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying previous seeds"

Like.destroy_all
Downvote.destroy_all
PointOfInterest.destroy_all
Trip.destroy_all
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
  terms: true,
)


test_user2 = User.create(
  email: "test_user2@gmail.com",
  password: "1234567",
  full_name: "Test McTest2",
  remote_photo_url: 'https://i.pravatar.cc/60',
  bio: "Currently travelling in Asia",
  description: "Being around the world with my bikie",
  blog: "https://medium.com/",
  terms:true,
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
[4.56900393092186707, 52.27620700091733852],
[4.92595787795585061, 52.1802584499173463],
[4.88581422977020541, 52.2455065521940369],
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
[4.35837897597332535, 52.0119227152636227],
[4.29968781740753414, 51.6794523786636617],
[4.15029462176751274, 51.7264302469553172],
[4.57788263261238448, 51.8149640959489445],
[4.39000596494880568, 51.8256325388390948],
[4.20538171600009747, 51.8578402420556372],
[4.24503269018832263, 51.9914941017116376],
[4.66176821834636801, 51.9463452042970388],
[4.73080857548744582, 52.0509299998066197],
[4.85629135170671855, 52.0733669067316711],
[4.80650354208736807, 51.9713766599526323],
[4.81482543258788098, 52.5480070116680622],
[4.76505802563431669, 52.6955275335201704],
[4.79135602010192407, 52.8143590857821863],
[4.73535425387907338, 52.5475972997628133],
[5.07236926255011689, 52.0959464018374873]
]

# set_of_poitypes = [1, 2, 3, 4, 5]
poi_types = POINT_OF_INTEREST.values.map { |poi| poi[:label] }

# POINT_OF_INTEREST[poi2.poi_type.to_sym]


set_of_geolocations.each_with_index do |item, index|
  PointOfInterest.create!(
    lat: set_of_geolocations[index][1], # set_of_geolocations[index_geolocation][lat]
    long: set_of_geolocations[index][0], # set_of_geolocations[index_geolocation][long]
    poi_type: poi_types.sample,
    description: 'some poi description',
    title: 'some title',
    user: test_user,
    remote_photo_url: 'https://source.unsplash.com/random/600x400'
    )
end

puts "#{PointOfInterest.count} PointOfInterest created "


# -----------

puts "Creating trips for test_user....."

2.times do
  trip1 = Trip.create(
   start_date: DateTime.parse("09/01/2019 17:00"),
   end_date: DateTime.parse("09/01/2020 19:00"),
   name: "Cycling the South East of Asia",
   km: 1000,
   blog: "www.mylife.com",
   user: test_user
   )
end

puts "#{Trip.count} trips created"


#-------------adding votes to the last POI ONLY (not all POI)--------------

puts "Creating likes and downvotes for the last POI ...."

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

puts " #{Like.count} likes #{Downvote.count} downvotes created"

