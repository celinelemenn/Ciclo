class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new
    @comment = Comment.new
    @user = User.find(params[:user])

    @poi = PointOfInterest.find(params[:point_of_interest_id])
    @bookmark.point_of_interest = @poi
    @bookmark.user = @user

    @existing_bookmark = Bookmark.find_by user: @user, point_of_interest: @poi

    if @existing_bookmark.nil?
      @bookmark.save
      render 'point_of_interests/show', point_of_interest: @poi
    else
      @existing_bookmark.delete
      render 'point_of_interests/show', point_of_interest: @poi
    end
  end
end
