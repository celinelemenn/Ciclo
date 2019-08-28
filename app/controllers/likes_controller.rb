class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user = User.find(params[:user])
    @like.point_of_interest = PointOfInterest.find(params[:point_of_interest_id])

    @like.save
  end

private

  def like_params
    # params.requires(:like).permit(:)
  end
end
