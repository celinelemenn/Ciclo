class Comment < ApplicationRecord
  belongs_to :point_of_interest
  belongs_to :user

  validates :content, presence: true

  def date
    date = -(created_at - DateTime.now) / 60

    if date < 60
      date = "#{date.round} min ago"
    elsif date > 60 && date < 1440
      date = "#{(date / 60).round} hours ago"
    elsif date > 1440 && date < 43_200
      date = (date / 1440).round
      date = "#{date} days ago"
    else
      date = (date / 43_200).round
      date = "#{date} months ago"
    end
    date
  end
end
