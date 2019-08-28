class PointOfInterestsController < ApplicationController
  before_action :find_poi, only: [:show]

  def index
  end

  def show
    raise
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
