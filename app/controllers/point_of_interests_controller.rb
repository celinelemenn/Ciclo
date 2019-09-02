class PointOfInterestsController < ApplicationController
  before_action :find_poi, only: [:show, :edit, :update]

  def index
    @user_poi = PointOfInterest.order(updated_at: :desc)
    @user_poi = @user_poi.select { |poi| poi.user == current_user }
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
    @poi.title = params[:point_of_interest]['title']
    @poi.poi_type = params[:point_of_interest]['poi_type']
    @poi.description = params[:point_of_interest]['description']
    @poi.photo = params[:point_of_interest]['photo']
    @poi.published = true

    if @poi.save
      redirect_to point_of_interest_path(@poi)

    else
      render :edit
    end
  end

  private

  def poi_params
    params.require(:point_of_interest).permit(:poi_type, :title, :description, :photo)
  end

  def find_poi
    @poi = PointOfInterest.find(params[:id])
  end

  def poi_params
    params.require(:point_of_interest).permit(:photo, :poi_type, :description)
  end

end
