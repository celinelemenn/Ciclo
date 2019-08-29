class PointOfInterest < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :likes
  has_many :downvotes
  has_many :comments
  has_many :reports

  mount_uploader :photo, PhotoUploader

  enum poi_type: [:water_refill, :camping, :caution, :landmark]

  def date
    date = -(self.created_at - DateTime.now) / 60

    if date < 60
      date = "#{date} min ago"
    elsif date > 60 || date < 1440
      date = "#{(date/60).round} hours ago"
    else
      date = (date / 1440).round
      date = "#{date} days ago"
    end
    date
  end
end
