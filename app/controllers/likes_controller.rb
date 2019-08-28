class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user = User.find(params[:user])
    @like.point_of_interest = PointOfInterest.find(params[:point_of_interest_id])
    @poi = PointOfInterest.find(params[:point_of_interest_id])

    if @like.save
      render 'point_of_interests/show', point_of_interest: @poi
    end

  end

private

  def like_params
    # params.requires(:like).permit(:)
  end
end
