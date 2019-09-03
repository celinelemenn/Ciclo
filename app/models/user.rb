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

  # The below have been added for messaging

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'

  validates :terms, presence: true

  mount_uploader :photo, PhotoUploader

  def name
    name = current_user.full_name
    @username = name.split.first.capitalize
  end
end
