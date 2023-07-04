class UserController < ApplicationController
    # before_action :authenticate_user!
    def current_user_json
        render json: {user: current_user, isLogin: user_signed_in?}, status: 200
    end
    #   helper_method :current_user_json
  end