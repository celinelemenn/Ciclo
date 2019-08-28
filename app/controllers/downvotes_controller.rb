class DownvotesController < ApplicationController
  def create
    @downvote = Downvote.new

    @user = User.find(params[:user])
    @downvote.user = @user

    @poi = PointOfInterest.find(params[:point_of_interest_id])
    @downvote.point_of_interest = @poi

    @existing_downvote = Downvote.find_by user: @user, point_of_interest: @poi

    if @existing_downvote.nil?
      @downvote.save
      render 'point_of_interests/show', point_of_interest: @poi
    else
      @existing_downvote.delete
      render 'point_of_interests/show', point_of_interest: @poi
    end
  end
end
