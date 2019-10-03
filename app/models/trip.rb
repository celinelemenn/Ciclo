class Trip < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :photo, :start_date, :name, presence: true
end
