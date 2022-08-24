class ReportsController < ApplicationController
  
  def new
    @report = Report.new
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

  def show
    @report = Report.find(params[:id])
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
  end

  def report_params
    params.require(:report).permit(:title, :body, :user_id)
  end
end
