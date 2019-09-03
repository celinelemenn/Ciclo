class ConversationsController < ApplicationController
  # We want to make sure that the user is logged in before they are able to create a conversation
  before_action :authenticate_user!
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]

  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  # Here we simply instantiate a personal message so we can use it in the view, nothing new.

  def show
    @conversation = Conversation.find params[:id]
    @personal_message = PersonalMessage.new
  end

  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @personal_message = current_user.personal_message.build
  end

  def create
    all_params = conversation_params.merge({ author_id: current_user.id })
    @conversation = Conversation.new all_params

    if @conversation.save
      redirect_to conversation_path @conversation
    else
      redirect_back(fallback_location: homepage_path)
    end
  end

  def destroy
  end

  private

  def conversation_params
    params.require(:conversation).permit(:receiver_id)
  end


  # The first private method simply returns the conversation based on the User's id
  # The second one checks if the current user is actually a participant in the given conversation
  # it calls on the participates method which is defined in the conversation model.
  # The participates method checks if a user is an author or a reciever of a convo.

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to conversations_path unless @conversation && @conversation.participates?(current_user)
  end
end
