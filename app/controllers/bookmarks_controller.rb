class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new
    @user = User.find(params[:id])

    @poi.PointOfInterest.find(params[:point_of_interest_id])
    @bookmark.point_of_interest = @poi

    @existing_bookmark = Bookmark.find_by user: @user, point_of_interest: @poi

    if @existing_bookmark.nil?
      @bookmark.save
      render 'bookmark/show', point_of_interest: @poi
    else
      @existing_downvote.delete
      render 'point_of_interests/show', point_of_interest: @poi
  end
 end
end
