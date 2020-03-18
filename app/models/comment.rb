class Comment < ApplicationRecord
  belongs_to :point_of_interest
  belongs_to :user

  validates :content, presence: true

  def date
    date = -(created_at - DateTime.now) / 60

    date = "#{date.round} min ago" if date < 60
    date = "#{(date / 60).round} hours ago" if date > 60 && date < 1440
    date = "#{(date / 1440).round} days ago" if date > 1440 && date < 43_200
    date = "#{(date / 43_200).round} months ago" if date > 43_200
    return date
  end
end
