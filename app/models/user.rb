class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :point_of_interests
  has_many :preferences
  has_many :reports
  has_many :trips
  has_many :bookmarks
  has_many :likes
  has_many :downvotes
  has_many :comments
  has_many :user_positions

  # The below have been added for messaging. Again, both conditions belong to the same
  # "Conversation" model, so we need to add the class_name. WE specify the foreign-key name
  # because usually rails uses the association name as the default foreign-key name.

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'

  # A user has many messages, but they should be deleted if the user is deleted:

  has_many :personal_messages, dependent: :destroy

  validates :terms, presence: true

  mount_uploader :photo, PhotoUploader

  def name
    name = current_user.full_name
    @username = name.split.first.capitalize
  end
end
