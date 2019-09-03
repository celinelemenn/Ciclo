class PersonalMessagesController < ApplicationController
  before_action :find_conversation!

  private

  # Whitelisting the params

  def personal_message_params
    params.require(:personal_message).permit(:body)
  end

  # The params of conversation_id comes from the hidden field tag in the conversations show page.

  def find_conversation
    @conversation = Conversation.find_by(id: params[:conversation_id])
    redirect_to conversations_path and return unless @conversation && @conversation.participates?(current_user)
  end
end
