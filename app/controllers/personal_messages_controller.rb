class PersonalMessagesController < ApplicationController
  before_action :find_conversation!

  # Before any action, we find the conversation. If its found, the user can participate in it, build a message, and save it.

  def create
    @conversation ||= Conversation.create(author_id: current_user.id, receiver_id: @conversation.receiver.id) unless Conversation.between(current_user.id, @conversation.receiver.id)[0]
    @personal_message = current_user.personal_messages.build(personal_message_params)
    @personal_message.conversation_id = @conversation.id
    @personal_message.save!

    flash[:success] = "Delivered"
    redirect_to conversation_path(@conversation)
  end

  def new
    redirect_to conversation_path(@conversation) && return if @conversation
    @personal_message = current_user.personal_message.build
  end

  private

  # Whitelisting the params

  def personal_message_params
    params.require(:personal_message).permit(:body)
  end

  # The params of conversation_id comes from the hidden field tag in the conversations show page.

  def find_conversation!
    if params[:receiver_id]
      @receiver = User.find_by(id: params[:receiver_id])
      @conversation = Conversation.between(current_user.id, @receiver.id)[0]
    else
      @conversation = Conversation.find(params[:conversation_id])
    end
  end
end
