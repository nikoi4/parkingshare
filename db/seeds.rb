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
    icon:      'https://res.cloudinary.com/nikoi4/image/upload/v1551303542/icons/fence-with-three-planks.svg'
  },
]

  features_attributes.each_with_index do |feature, index|
    f = Feature.new(feature)
    f.save
  end

  puts "finished seeding"
