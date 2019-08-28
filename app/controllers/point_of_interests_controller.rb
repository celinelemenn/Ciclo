class PointOfInterestsController < ApplicationController
  before_action :find_poi, only: [:show]

  def index
  end

  def show
    @date = -(@poi.created_at - DateTime.now).to_i / 60
    if @date < 60
      @date = "#{@date} min ago"
    elsif @date > 60 || @date < 1440
      @date = "#{@date} hours ago"
    else
      @date = (@date / 1440).to_i
      @date = "#{@date} days ago"
    end
  end

  def new
  end

  def create
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

end
