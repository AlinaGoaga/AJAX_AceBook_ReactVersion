class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    api_v1_users_check_for_user_path
  end

  def after_sign_in_path_for(_resource)
    api_v1_users_check_for_user_path
  end
end
