# frozen_string_literal: true

class ApplicationController < ActionController::Base
    #ログイン後リダイレクトするパス
    def after_sign_in_path_for(resource)
        books_path(resource)
    end

    def afrer_sign_out_path_for(resource)
        user_session_path(resource)
    end
end
