puts "Creating Features"

features_attributes = [
  {
    name:      'Instant',
    icon:      'https://res.cloudinary.com/nikoi4/image/upload/v1551210641/bolt-solid.svg'
  },
  {
    name:      'Security',
    icon:      'https://res.cloudinary.com/nikoi4/image/upload/v1551210642/policeman.svg'
  },
  {
    name:      'Gated',
    icon:      'https://res.cloudinary.com/nikoi4/image/upload/v1551210642/fence-with-three-planks.svg'
  },
  {
    name:      'Camera',
    icon:      'https://res.cloudinary.com/nikoi4/image/upload/v1551210642/video-solid.svg'
  },
  {
    name:      'Cover',
    icon:      'https://res.cloudinary.com/nikoi4/image/upload/v1551210642/umbrella-solid.svg'
  },
]

  features_attributes.each_with_index do |feature, index|
    f = Feature.new(feature)
    f.save
  end

  puts "finished seeding"
