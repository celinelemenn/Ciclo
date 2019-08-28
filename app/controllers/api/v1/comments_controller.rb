class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    # @comment = Comment.new(comment_params)

    # @point_of_interest = PointOfInterest.find(params[:point_of_interest_id])
    # @user = User.find(params.require(:comment).permit(:user)[:user])
    # @comment.user = @user
    # @comment.point_of_interest = @point_of_interest

    # if @comment.save!
    #   respond_to do |format|
    #     # format.html { redirect_to point_of_interest_path(@point_of_interest) }
    #     format.js
    #   end
    # else
    #   respond_to do |format|
    #     # format.html { render "point_of_interests/show" }
    #     format.js
    #   end
    # end
    render json: { status: params[:test] }
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
