class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  devise :omniauthable, omniauth_providers: %i[facebook]

  has_many :point_of_interests
  has_many :preferences
  has_many :reports
  has_many :trips
  has_many :bookmarks
  has_many :likes
  has_many :downvotes
  has_many :comments
  has_many :user_positions
  has_many :feedbacks

  # The below have been added for messaging. Again, both conditions belong to the same
  # "Conversation" model, so we need to add the class_name. WE specify the foreign-key name
  # because usually rails uses the association name as the default foreign-key name.

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'

  # A user has many messages, but they should be deleted if the user is deleted:

  has_many :personal_messages, dependent: :destroy

  validates :full_name, presence: true

  mount_uploader :photo, PhotoUploader

  # welcome email when user is created
  after_create :send_welcome_email

  def name
    name = full_name
    @username = name.split.first.capitalize
  end

  def distance(user)
    if user.user_positions.last && !user_positions.last.lat.nil?
      coords_cyclist = [user_positions.last.lat, user_positions.last.long]
      coords_user = [user.user_positions.last.lat, user.user_positions.last.long]
      distance = Geocoder::Calculations.distance_between(coords_cyclist, coords_user, units: :km)
      distance.round(2).to_s
    else
      ""
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name # assuming the user model has a name
      # raise
      # user.remote_photo_url = auth.info.image
      user.remote_photo_url = "https://res.cloudinary.com/dwkwy2q1n/image/facebook/#{user.uid}.jpg"
      # user.save! # assuming the user model has an image
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

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome_2.deliver_later
  end
end
