class Trip < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :start_date, :name, presence: true

  validate :deadline_is_possible?

  def deadline_is_possible?
    # return if end_date.blank? || start_date.blank?
    end_date = Date.today if end_date.nil?

    errors.add(:start_date, "must be earlier than end date") if end_date < start_date
  end

  CYCLING_ROUTES = [
    'EuroVelo1 - Atlantic Coast Route',
    'EuroVelo2 - Capitals Route',
    'EuroVelo3 - Pilgrims Route',
    'EuroVelo4 - Central Europe Route',
    'EuroVelo5 - Via Romea (Francigena)',
    'EuroVelo6 - Atlantic – Black Sea',
    'EuroVelo7 - Sun Route',
    'EuroVelo8 - Mediterranean Route',
    'EuroVelo9 - Baltic – Adriatic',
    'EuroVelo10 - Baltic Sea Cycle Route',
    'EuroVelo11 - East Europe Route',
    'EuroVelo12 - North Sea Cycle Route',
    'EuroVelo15 - Rhine Cycle Route',
    'EuroVelo17 - Rhone Cycle Route',
    'EuroVelo19 - Meuse Cycle Route',
    'Silk Road',
    'South East Asia',
    'South America - West Coast',
    'US - Pacific Coast',
    'US - East to West',
    'Africa - West Coast',
    'Africa - East Coast'
  ]

  def trip_time
    self.end_date = Date.today if end_date.nil?

    (start_date.to_date..end_date.to_date).to_a.size
  end

  def country_name
    if country_code.nil? || country_code.empty?
      country = ""
    else
      country = ISO3166::Country[country_code.to_s]
      country.translations[I18n.locale.to_s] || country.name
    end
  end
end
