class PointOfInterestsController < ApplicationController
  before_action :find_poi, only: %i[show edit update destroy]

  def index
  end

  def show
    @comment = Comment.new
    @report = Report.new
  end

  def new
    @point_of_interest = PointOfInterest.new
  end

  def create
    @point_of_interest = PointOfInterest.new(poi_params)
    @point_of_interest.user = current_user
    @user_position = UserPosition.where(user_id: current_user.id).last
    @point_of_interest.lat = @user_position.lat
    @point_of_interest.long = @user_position.long

    if params[:commit] == t('poi_page.form.action.submit_now', locale: set_locale)
      @point_of_interest.published = true
      if @point_of_interest.save
        NewPoiCountryNameJob.perform_later(@point_of_interest.id)
        redirect_to map_path
      else
        render :new
      end

    else
      @point_of_interest.published = false
      if @point_of_interest.save
        NewPoiCountryNameJob.perform_later(@point_of_interest.id)
        redirect_to map_path
      else
        render :new
      end
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

  def destroy
    @poi.delete
    redirect_to feed_path
  end

  private

  def poi_params
    params.require(:point_of_interest).permit(:poi_type, :title, :description, :photo, :title)
  end

  def find_poi
    @poi = PointOfInterest.find(params[:id])
  end
end
