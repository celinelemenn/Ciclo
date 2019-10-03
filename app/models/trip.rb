class Trip < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :photo, :start_date, :name, presence: true

  validate :deadline_is_possible?

  def deadline_is_possible?
    # return if end_date.blank? || start_date.blank?

    errors.add(:start_date, "must be earlier than end date") if end_date < start_date
  end
end
