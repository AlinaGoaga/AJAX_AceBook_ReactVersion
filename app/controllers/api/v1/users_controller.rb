class Api::V1::UsersController < ApplicationController
  def check_for_user
    if current_user != nil
      render json: current_user.as_json
    else
      render :json => {}
    end
  end
end
