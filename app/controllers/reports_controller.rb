# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def new
    @report = Report.new
  end

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      redirect_to reports_url
    else
      render :reports_path
    end
  end

  def show; end

  def destroy
    @report.destroy
    redirect_to reports_url
  end

  def update
    if @report.update(report_params)
      redirect_to reports_url
    else
      render :edit
    end
  end

  def edit
    redirect_to report_path unless current_user == @report.user
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :body, :user_id)
  end
end
