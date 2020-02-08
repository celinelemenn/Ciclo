class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  # Obviously, we don't want to send messages that are empty so:

  validates :body, presence: true

  def date
    if created_at.to_date == Date.today
      created_at.strftime("%H:%M%p today")
    else
      created_at.strftime("%H:%M%p, %d %b")
    end
  end
end
