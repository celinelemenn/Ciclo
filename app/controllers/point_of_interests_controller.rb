class PointOfInterestsController < ApplicationController
  before_action :find_poi, only: [:show]

  def index
  end

  def show
    @comment = Comment.new
  end

  def new
    @point_of_interest = PointOfInterest.new
  end

  def create
    @point_of_interest = PointOfInterest.new(poi_params)
    @point_of_interest.user = current_user
    @point_of_interest.lat = -29.4981176
    @point_of_interest.long = -51.9925595
    @point_of_interest.published = true
    if @point_of_interest.save!
      redirect_to map_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def poi_params

  end

  def find_poi
    @poi = PointOfInterest.find(params[:id])
  end

  def poi_params
    params.require(:point_of_interest).permit(:photo, :poi_type, :description)
  end

end
