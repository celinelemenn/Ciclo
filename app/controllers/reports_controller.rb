class ReportsController < ApplicationController
  def new
    @report = Report.new
    @poi = PointOfInterest.find(params["point_of_interest_id"])
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user
    @poi = PointOfInterest.find(params["point_of_interest_id"])
    @report.point_of_interest = @poi
    if @report.save!
      redirect_to point_of_interest_path(@poi)
    else
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:issue_type, :content)
  end
end
