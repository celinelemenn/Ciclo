class PointOfInterestsController < ApplicationController
  before_action :find_poi, only: [:show, :edit, :update]

  def index
    @user_poi = PointOfInterest.select { |poi| poi.user == current_user}
  end

  def show
    @comment = Comment.new
  end

  def new
  end

  def create
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

end
