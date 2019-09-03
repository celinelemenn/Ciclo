class ConversationsController < ApplicationController
  # We want to make sure that the user is logged in before they are able to create a conversation

  before_action :authenticate_user!

  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  def show

  end

  def create
  end

  def destroy
  end
end
