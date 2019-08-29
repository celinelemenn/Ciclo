class Trip < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

end
