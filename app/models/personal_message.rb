class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  # Obviously, we don't want to send messages that are empty so:

  validates :body, presence: true
end
