class DownvotesController < ApplicationController
  def create
    @downvote = Downvote.new
    @comment = Comment.new
    @user = User.find(params[:user])
    @downvote.user = @user

    @poi = PointOfInterest.find(params[:point_of_interest_id])
    @downvote.point_of_interest = @poi

    @existing_downvote = Downvote.find_by user: @user, point_of_interest: @poi

    if @existing_downvote.nil?
      @downvote.save
      redirect_to point_of_interest_path(@poi)
      # render 'point_of_interests/show', point_of_interest: @poi
    else
      @existing_downvote.delete
      redirect_to point_of_interest_path(@poi)
      # render 'point_of_interests/show', point_of_interest: @poi
    end
  end
end
