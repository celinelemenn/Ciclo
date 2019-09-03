class Api::V1::PointOfInterestsController < Api::V1::BaseController
  def index
    pois = PointOfInterest.where(published: true)
    # raise
    @poi = []
    pois.each do |poi|
      temp_poi = {}
      temp_poi[:poi] = poi
      temp_poi[:marker_link] = POINT_OF_INTEREST[poi.poi_type.to_sym][:marker_icon]
      @poi << temp_poi
    end
  end
end
