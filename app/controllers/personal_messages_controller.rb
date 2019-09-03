class PersonalMessagesController < ApplicationController
  before_action :find_conversation!

  # Before any action, we find the conversation. If its found, the user can participate in it, build a message, and save it.

  def create
    @conversation ||= Conversation.create(author_id: current_user.id, receiver_id: @receiver.id)
    @personal_message = current_user.personal_messages.build(personal_message_params)
    @personal_message.conversation_id = @conversation.id
    @personal_message.save!

    flash[:success] = "Delivered"
    redirect_to conversation_path(@conversation)
  end

  def new
    @personal_message = current_user.personal_messages.build
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
      redirect_to conversations_path and return unless @receiver
      @conversation = Conversation.between(current_user.id, @receiver.id)[0]
    else
      @conversation = Conversation.find_by(id: params[:id])
      redirect_to conversations_path and return unless @conversation && @conversation.participates?(current_user)
    end
  end
end
