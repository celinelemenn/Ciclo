# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.with(user: User.first).welcome
  end
  def chat
    UserMailer.with(user:User.first, conversation: Conversation.last, receiver: Conversation.last.receiver).chat
  end

end
