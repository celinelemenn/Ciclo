class ConversationsController < ApplicationController
  # We want to make sure that the user is logged in before they are able to create a conversation
  before_action :authenticate_user!
  before_action :set_conversation, except: %i[index create]
  before_action :check_participating!, except: %i[index create]

  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
    @badge_poi_unpublished = PointOfInterest.select { |poi| poi.user == current_user && poi.published == false }.count
  end

  # Here we simply instantiate a personal message so we can use it in the view, nothing new.

  def show
    @conversation = Conversation.find params[:id]
    @personal_message = PersonalMessage.new
  end

  def create
    all_params = conversation_params.merge(author_id: current_user.id)
    @conversation_between = Conversation.between(current_user.id, params[:conversation][:receiver_id])[0]
    if !@conversation_between
      @conversation = Conversation.new(all_params)
      redirect_to new_conversation_personal_message_path(@conversation.id) if @conversation.save
    else
      # raise
      redirect_to conversation_path(@conversation_between)
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
    redirect_to conversations_path unless @conversation&.participates?(current_user)
  end
end
