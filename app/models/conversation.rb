class Conversation < ApplicationRecord

  # Conversations should belong to an author and a reciever. Since they belong to
  # the same model, we have to give them a "class_name"

  belongs_to :author, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  # The association below is added to specify the has_many relationship with personalMessages
  # It also sets the default sorting so that the latest message always displays first. Lastly,
  # if you destroy a conversation, you destory all of its messages too.

  has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

  # The validation below ensures that there cannot be more than on converation
  # between a pair of users

  validates :author, uniqueness: { scope: :reciever }
end
