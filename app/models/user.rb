class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  has_many :bookings, dependent: :destroy
  has_many :parkings
  has_many :owned_parkings, foreign_key: "user_id", class_name: "Parking", dependent: :destroy
  has_many :booked_parkings, through: :bookings, source: :parking, dependent: :destroy
  # has_many :owned_bookings, through: :parkings, source: :booking
  has_many :searches
  has_many :chats

  before_create :set_defaults

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.first_name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def owned_bookings
    bookings = []

    self.owned_parkings.each do |parking|
      parking.bookings.each do |booking|
        bookings << booking
      end
    end
    return bookings
  end

  def identifier
    if (first_name).nil?
      email
    else
      return "#{first_name.capitalize}"
    end
  end

  def identifierfull
    if (last_name).nil?
      first_name.capitalize
    else
      return "#{first_name.capitalize} #{last_name.capitalize}"
    end
  end

  private

  def set_defaults
    self.image = 'https://res.cloudinary.com/nikoi4/image/upload/v1551961442/icons/gnr_prf.png'
  end
end
