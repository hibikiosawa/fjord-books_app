# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    #ログイン後リダイレクトするパス
    def after_sign_in_path_for(resource)
        books_path(resource)
    end

    def afrer_sign_out_path_for(resource)
        user_session_path(resource)
    end

    private
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[username postcode address profile])
    end
  end