class Conversation < ApplicationRecord

  # Conversations should belong to an author and a reciever. Since they belong to
  # the same model, we have to give them a "class_name"

  belongs_to :author, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  # The validation below ensures that there cannot be more than on converation
  # between a pair of users

  validates :author, uniqueness: { scope: :reciever}
end
