class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  # due the fact that we are creating the comment field in the same page as point of interest we need to access user in more specific way
  def create
    @comment = Comment.new(comment_params)
    @point_of_interest = PointOfInterest.find(params[:point_of_interest_id])
    @user = User.find(params.require(:comment).permit(:user)[:user])
    @comment.user = @user
    @comment.point_of_interest = @point_of_interest

    if @comment.save!
      respond_to do |format|
        format.html { redirect_to point_of_interest_path(@point_of_interest) }
        # format.js
      end
    else
      respond_to do |format|
        format.html { render "point_of_interests/show" }
        # format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
