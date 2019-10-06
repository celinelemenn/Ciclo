class Trip < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :photo, :start_date, :name, presence: true

  validate :deadline_is_possible?

  def deadline_is_possible?
    # return if end_date.blank? || start_date.blank?

    errors.add(:start_date, "must be earlier than end date") if end_date < start_date
  end

   CYCLING_ROUTES = [
      'EuroVelo1', 'EuroVelo2', 'EuroVelo3', 'EuroVelo4', 'EuroVelo5', 'EuroVelo6',
      'EuroVelo7', 'EuroVelo8', 'EuroVelo9', 'EuroVelo10', 'EuroVelo11', 'EuroVelo12',
      'EuroVelo15', 'EuroVelo17', 'EuroVelo19',
      'Silk Road', 'South East Asia', 'South America West Coast', 'US Pacific Coast', 'US East to West'
    ]
end
