puts "Seeding"

#-----------------------------------------------------------

puts "Creating Features"
features_attributes = [
  {
    name:      'Instant',
    icon:      'https://res.cloudinary.com/nikoi4/image/upload/v1551303544/icons/bolt-solid.svg'
  },
  {
    name:      'Security',
    icon:      'https://res.cloudinary.com/nikoi4/image/upload/v1551303544/icons/policeman.svg'
  },
  {
    name:      'Gated',
    icon:      'https://res.cloudinary.com/nikoi4/image/upload/v1551303542/icons/fence-with-three-planks.svg'
  },
  {
    name:      'Camera',
    icon:      'https://res.cloudinary.com/nikoi4/image/upload/v1551303544/icons/video-solid.svg'
  },
  {
    name:      'Cover',
    icon:      'https://res.cloudinary.com/nikoi4/image/upload/v1551303542/icons/umbrella-solid.svg'
  },
]

  features_attributes.each_with_index do |feature, index|
    f = Feature.new(feature)
    f.save
  end

#-----------------------------------------------------------

puts 'Creating Users...'
user_attributes = [
  {
    email:         'owner@parking.com',
    password:      '12345678',
    first_name:    'Rodrigo',
    last_name:     'Cabral',
    image:         'https://res.cloudinary.com/nikoi4/image/upload/v1551962124/icons/41546766.jpg'
  },
  {
    email:         'user@parking.com',
    password:      '12345678',
    first_name:    'Seba',
    last_name:     'BuffoSempe',
    image:         'https://res.cloudinary.com/nikoi4/image/upload/v1552062097/icons/seba.jpg'
  },
  {
    email:         'owner1@parking.com',
    password:      '12345678',
    first_name:    'Nico',
    last_name:     'Caif',
    image:         'https://res.cloudinary.com/nikoi4/image/upload/v1551962131/icons/45802152.jpg'
  },
  {
    email:         'owner3@parking.com',
    password:      '12345678',
    first_name:    'Boris',
    last_name:     'Paillard',
    image:         'https://pbs.twimg.com/profile_images/990936890726670336/gApnSP5j_400x400.jpg'
  },
  {
    email:         'user1@parking.com',
    password:      '12345678',
    first_name:    'Charly',
    last_name:     'Garcia',
    image:         'https://res.cloudinary.com/nikoi4/image/upload/v1552010000/icons/charly.jpg_423682103-2.jpg'
  },
  {
    email:         'user2@parking.com',
    password:      '12345678',
    first_name:    'Samuel',
    last_name:     'Levy',
    image:         'https://res.cloudinary.com/nikoi4/image/upload/v1552062299/icons/sam.jpg'
  },
]

User.create!(user_attributes)
# User.all.each do |u|
#   u.image = "https://res.cloudinary.com/nikoi4/image/upload/v1551961442/icons/gnr_prf.png"
#   u.save!
# end

owner = User.all[0]
user = User.all[1]
owner1 = User.all[2]
owner3 = User.all[3]
user1 = User.all[4]
user2 = User.all[5]

#-----------------------------------------------------------

puts 'Creating Parkings...'

parking_attributes = [
  {
    name:         "Martha's Building",
    address:      'Thames 2338, Buenos Aires',
    description:  'Centrally located spot only minutes from Old Street station',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner3,
  },
  {
    name:         "Greg's Parking",
    address:      'Thames 2138, Buenos Aires',
    description:  'Secure car parking space in Palermo',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner3,
  },
    {
    name:         "Rodri's Parking Garage",
    address:      'Jean Jaures 1165, Buenos Aires',
    description:  'Ideally located - only a 2-3 minute walk to UBA Med School',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner1,
  },
    {
    name:         "Bill's Garage",
    address:      'Malabia 2240, Buenos Aires',
    description:  'Spacious garage perfect for cars, people carriers or even work vans',
    size:         "Truck",
    price_cents:  rand(40..90),
    user:         owner,
  },
    {
    name:         "Nico's Lot",
    address:      'Malabia 2000, Buenos Aires',
    description:  '2 minutes away from Metro Station Scalabrini Ortiz',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner1,
  },
    {
    name:         "Mike' Garage Space",
    address:      'Malabia 1000, Buenos Aires',
    description:  'Space in a small fenced car park at the front of a residential building',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner1,
  },
    {
    name:         "Sam's Building Garage",
    address:      'Migueletes 2213, Buenos Aires',
    description:  'Parking spot in apartment building 2 mins walk from Kansas',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner3,
  },
    {
    name:         "Claire appt 14b",
    address:      'Thames 2038, Buenos Aires',
    description:  'Parking space at building 2nd floor',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner3,
  },
    {
    name:         "Alfie's Place",
    address:      'Juramento 1000, Buenos Aires',
    description:  '****** NEW LISTING *******',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner,
  },
    {
    name:         "Mati's Garage",
    address:      'Jean jaures 399, Buenos Aires',
    description:  'Safe parking space available just for you',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner1,
  },
    {
    name:         "Connie's Parking Place",
    address:      'Jean jaures 299, Buenos Aires',
    description:  'Reasonable space, not suitable for larger vehicles e.g. vans and minibuses',
    size:         "Small Car",
    price_cents:  rand(40..90),
    user:         owner3,
  },
    {
    name:         "Cris'Residential Garage",
    address:      'Paraguay 1065, Buenos Aires',
    description:  'My space is a driveway in a quite residential close',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner,
  },
    {
    name:         "Eloy-Garage",
    address:      'Paraguay 1165, Buenos Aires',
    description:  'Good transport links to Downtown Buenos Aires',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner,
  },
    {
    name:         "Cochera 25b",
    address:      'San Martin de Tours 2908, Buenos Aires',
    description:  'Perfectly located for those driving into city center looking to avoid congestion',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner3,
  },
    {
    name:         "Elizabeth - Parking Lot",
    address:      'Yatay 1165, Buenos Aires',
    description:  'All booking fees are given to charity. Multiple entry and exit permitted.',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner,
  },
    {
    name:         "Laura's Garage",
    address:      'Bulnes 1700, Buenos Aires',
    description:  'There are great connections to city center',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner3,
  },
    {
    name:         "Lionel's Parking Garage",
    address:      'Bulnes 1890, Buenos Aires',
    description:  'Some People says that I am better than D1eg0 s Lot',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner,
  },
    {
    name:         "Federica's Parking",
    address:      'Bulnes 2707, Buenos Aires',
    description:  'Space in my back garden, 15 minutes walk from Alto Palermo',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner3,
  },
    {
    name:         "D1eg0's Lot",
    address:      'Jeronimo Salguero 1165, Buenos Aires',
    description:  'The God of all parking lots',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner,
  },
    {
    name:         "Sebastian's Parking Lot",
    address:      'Jeronimo Salguero 2165, Buenos Aires',
    description:  'Right in the heart of Palermo',
    size:         Parking::SIZE_CAR.sample,
    price_cents:  rand(40..90),
    user:         owner3,
  },
]

parking_attributes.each do |parking_attribute|
  p = Parking.new(parking_attribute)
  p.save!
end

#-----------------------------------------------------------

puts 'Assigning Pictures to Parkings...'

COCHERAS = [
            ["https://images.unsplash.com/photo-1486006920555-c77dcf18193c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1495435229349-e86db7bfa013?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1508465487720-54cef28cc719?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1470880587080-599f3e4f0913?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1489847737011-2f9e5f5aa2e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1505545121909-2d48e22dede6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1512464099600-d83e8069aa75?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1530268578403-df6e89da0d30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1495434951808-370bf1154920?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1474408886716-087263db7da1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1463541555616-ad5d33ef6339?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1489847737011-2f9e5f5aa2e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1486006920555-c77dcf18193c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1445548671936-e1ff8a6a6b20?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1523918646955-42c104ef7349?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1532439771208-8fda693b96b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1548343361-02248be15911?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE2ODQ0fQ&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1494255177615-8af17149db84?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=60"],
            ["https://images.unsplash.com/photo-1470880587080-599f3e4f0913?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1494976351278-20cf4a33d65b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=60",
            "https://images.unsplash.com/photo-1486006920555-c77dcf18193c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1486006920555-c77dcf18193c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1495435229349-e86db7bfa013?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1508465487720-54cef28cc719?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1470880587080-599f3e4f0913?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1489847737011-2f9e5f5aa2e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1505545121909-2d48e22dede6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1512464099600-d83e8069aa75?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1530268578403-df6e89da0d30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1495434951808-370bf1154920?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1474408886716-087263db7da1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1463541555616-ad5d33ef6339?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1489847737011-2f9e5f5aa2e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1486006920555-c77dcf18193c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1445548671936-e1ff8a6a6b20?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1523918646955-42c104ef7349?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1532439771208-8fda693b96b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1548343361-02248be15911?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE2ODQ0fQ&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1494255177615-8af17149db84?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=60"],
            ["https://images.unsplash.com/photo-1470880587080-599f3e4f0913?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1494976351278-20cf4a33d65b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=60",
            "https://images.unsplash.com/photo-1486006920555-c77dcf18193c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1486006920555-c77dcf18193c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1495435229349-e86db7bfa013?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1508465487720-54cef28cc719?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1470880587080-599f3e4f0913?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1489847737011-2f9e5f5aa2e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1505545121909-2d48e22dede6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1512464099600-d83e8069aa75?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1530268578403-df6e89da0d30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1495434951808-370bf1154920?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1474408886716-087263db7da1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1463541555616-ad5d33ef6339?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1489847737011-2f9e5f5aa2e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1486006920555-c77dcf18193c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1445548671936-e1ff8a6a6b20?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1523918646955-42c104ef7349?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80"],
            ["https://images.unsplash.com/photo-1532439771208-8fda693b96b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1548343361-02248be15911?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE2ODQ0fQ&auto=format&fit=crop&w=1440&q=80",
            "https://images.unsplash.com/photo-1494255177615-8af17149db84?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1440&q=60"]
            ]


Parking.all.each_with_index do |parking, index|
  pic = Picture.new()
  pic.remote_picture_url = COCHERAS[index][0]
  pic.parking = parking
  pic.save!
  pic1 = Picture.new()
  pic1.remote_picture_url = COCHERAS[index][1]
  pic1.parking = parking
  pic1.save!
  pic2 = Picture.new()
  pic2.remote_picture_url = COCHERAS[index][2]
  pic2.parking = parking
  pic2.save!
end

#------------------------------------------------------(24 * rand(40..90)).to_s

puts 'Creating Parking Lot Features'

Parking.all.each do |parking|
  Feature.all.each do |feature|
    if 1 == rand(0..1)
      plt = ParkingLotFeature.new
      plt.feature = feature
      plt.parking = parking
      plt.save!
    end
  end
end

#-----------------------------------------------------------

puts 'Creating bookings'

p1 = Parking.first
p2 = Parking.first


booking_attributes = [
  {
    status:    'approved',
    car_plate: 'HPM 147',
    start_date:'19/02/20',
    end_date:  '19/02/21',
    user: user,
    price_cents: (24 * rand(40..90)).to_s
  },
  {
    status:    'approved',
    car_plate: 'AC 826 KF',
    start_date:'19/02/22',
    end_date:  '19/02/23',
    user: user2,
    price_cents: (24 * rand(40..90)).to_s
  },
  {
    status:    'approved',
    car_plate: 'AC 826 KF',
    start_date:'19/02/21',
    end_date:  '19/02/22',
    user: user1,
    price_cents: (24 * rand(40..90)).to_s
  },
  {
    status:    'approved',
    car_plate: 'AC 826 KF',
    start_date:'19/02/26',
    end_date:  '19/02/27',
    user: user,
    price_cents: (24 * rand(40..90)).to_s
  },
  {
    status:    'approved',
    car_plate: 'AC 826 KF',
    start_date:'19/02/18',
    end_date:  '19/02/19',
    user: user1,
    price_cents: (24 * rand(40..90)).to_s
  },
]

Parking.all.each do |parking|
  parking.bookings.create!(booking_attributes)
end

Booking.all.each do |booking|
  booking.status = 'approved'
  booking.save!
end

#-----------------------------------------------------------

puts 'Creating reviews...'
reviews_attributes = [
  {
    content:      'Nice place, but not such a nice experience',
    rating:       3,
    date:         '19/03/01',
  },
  {
    content:      'Convenient, close to centre, safe, hassle free parking.',
    rating:       3,
    date:         '19/03/02',
  },
  {
    content:      'Easy to find and good location close to town.',
    rating:       4,
    date:         '19/03/03',
  },
  {
    content:      'Brilliant, safe space, easy to park, near station, helpful people.',
    rating:       5,
    date:         '19/03/04',
  },
  {
    content:      'Great location, easy to park, close to stores',
    rating:       4,
    date:         '19/03/05',
  },
  {
    content:      'The space was ok, but it was dirty',
    rating:       3,
    date:         '19/03/05',
  },
    {
    content:      'Everything was great',
    rating:       5,
    date:         '19/03/05',
  },
    {
    content:      'The space was ok, but it was dirty',
    rating:       3,
    date:         '19/03/05',
  },
    {
    content:      'The owner was very kind and helpful',
    rating:       5,
    date:         '19/03/05',
  },
  {
    content:      'Easy to park, close to stores',
    rating:       5,
    date:         '19/03/05',
  },
  {
    content:      'Good location close to town.',
    rating:       4,
    date:         '19/03/03',
  },
]

Booking.all.each do |booking|
  booking.reviews.create!(reviews_attributes[rand(0..10)])
end



puts "finished seeding"
