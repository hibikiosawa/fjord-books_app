class ReportsController < ApplicationController
  
  def new
    @report = Report.new
  end

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def create
    @report = Report.new(report_params)
    @report.save
  end

  def report_params
    params.permit(:title, :body, :user_id)
  end
end
