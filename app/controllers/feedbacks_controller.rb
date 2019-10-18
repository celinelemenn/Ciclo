class FeedbacksController < ApplicationController
  # before_action :feedback_params

  def create
    @feedback = Feedback.create(feedback_params)
    @feedback.user = current_user
    if @feedback.save
      redirect_to contact_path
    else
      @user = User.find_by(admin: true)
      if params[:receiver_id]
        @conversation = Conversation.find_by(recevier_id: params[:id])
      else
        @conversation = Conversation.new
      end
      render "pages/contact"
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:rating, :comment)
  end
end
