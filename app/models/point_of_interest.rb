class PointOfInterest < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :likes
  has_many :downvotes
  has_many :comments
  has_many :reports

  scope :published, -> { where(published: true) }
  scope :camping, -> { where(poi_type: :camping) }
  scope :caution, -> { where(poi_type: :caution) }
  scope :landmark, -> { where(poi_type: :landmark) }
  scope :water, -> { where(poi_type: :water_refill) }
  scope :toilet, -> { where(poi_type: :toilet) }
  scope :wild_camping, -> { where(poi_type: :wild_camping) }
  scope :hotel, -> { where(poi_type: :hotel) }
  scope :bar, -> { where(poi_type: :bar) }
  scope :shopping, -> { where(poi_type: :shopping) }
  scope :wifi, -> { where(poi_type: :wifi) }
  scope :picnic, -> { where(poi_type: :picnic) }
  scope :repair, -> { where(poi_type: :repair) }
  scope :info_point, -> { where(poi_type: :info_point) }
  scope :electricity, -> { where(poi_type: :electricity) }
  scope :resto, -> { where(poi_type: :resto) }

  validates :poi_type, :description, :title, presence: true, if: :published?

  mount_uploader :photo, PhotoUploader

  reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode

  enum poi_type: POINT_OF_INTEREST.keys


  def date
    date = -(self.created_at - DateTime.now) / 60

    if date < 60
      date = "#{date.round} min ago"
    elsif date > 60 && date < 1440
      date = "#{(date/60).round} hours ago"
    else
      date = (date / 1440).round
      date = "#{date} days ago"
    end
    date
  end

  def published?
    self.published == true
  end

  def name
    if poi_type
      POINT_OF_INTEREST[self.poi_type.to_sym][:name]
    end
  end

  def icon
    if poi_type
      POINT_OF_INTEREST[self.poi_type.to_sym][:marker_icon]
    else
      'https://i.imgur.com/D7Zyk2z.png'
    end
  end

  def distance(user)
    if user.user_positions.last && !self.lat.nil?
      coords_poi = [self.lat, self.long]
      coords_user = [user.user_positions.last.lat, user.user_positions.last.long]
    distance = Geocoder::Calculations.distance_between(coords_poi, coords_user, :units => :km)
    "#{distance.round(2)} km away"
    else
      ""
    end
  end

  private

end
