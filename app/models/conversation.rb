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

  validates :author, uniqueness: { scope: :receiver }

  # Below, we define a scope called participating. A scope basically makes a subset of a collection. So in this case
  # we are making a subset of conversation called participating in which we associate a user ID with both receiver ID
  # and author ID. This link explains it well: https://stackoverflow.com/questions/4869994/what-is-scope-named-scope-in-rails

  scope :participating, -> (user) do
    where("(conversations.author_id = ? OR conversations.receiver_id = ?)", user.id, user.id)
  end

  # The with method before is implemented in the shared view _conversation. It is a method which returns the OTHER
  # participant of a conversation. If you look at the if condition,
  # It basically says that if the current user is the author, return receiver. Like this we are able to associate the other
  # participant by dissassociating the current_user

  def with(current_user)
    author == current_user ? receiver : author
  end

  # The method below simply checks if a given user is part of a conversation or not.

  def participates?(user)
    author == user || receiver == user
  end
end
