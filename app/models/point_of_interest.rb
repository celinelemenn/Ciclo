class PointOfInterest < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :likes
  has_many :downvotes
  has_many :comments
  has_many :reports

  mount_uploader :photo, PhotoUploader

  enum poi_type: [:water_refill, :camping, :caution, :landmark]
end
