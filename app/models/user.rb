class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :point_of_interests
  has_many :preferences

  has_many :reports
  has_many :bookmarks
  has_many :likes
  has_many :downvotes
  has_many :comments

  has_many :user_positions

  validates :terms, presence: true

  mount_uploader :photo, PhotoUploader
end
