class LikesController < ApplicationController
  def create
    @like = Like.new
    @comment = Comment.new
    @user = User.find(params[:user])
    @like.user = @user

    @poi = PointOfInterest.find(params[:point_of_interest_id])
    @like.point_of_interest = @poi

    @existing_like = Like.find_by user: @user, point_of_interest: @poi

    if @existing_like.nil?
      @like.save
      render 'point_of_interests/show', point_of_interest: @poi
    else
      @existing_like.delete
      render 'point_of_interests/show', point_of_interest: @poi
    end

  end
end
