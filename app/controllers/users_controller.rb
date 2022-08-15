# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page])
    @users = User.order(:id).page(params[:page]).with_attached_avatar.all
  end

  def show
    @user = User.find(params[:id])
  end
end
