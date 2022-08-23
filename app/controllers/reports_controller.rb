class ReportsController < ApplicationController
  
  def new
    @report = Report.new
  end

  def show
    @reports = Report.find(params[:id])
  end

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.save
    redirect_to reports_path
  end

  def report_params
    params.permit(:title, :body, :user_id)
  end
end
