class ApplicationController < ActionController::Base

  protected

  def after_sign_out_path_for(resource)
    root_path
  end

  def auth_user
    redirect_to root_path unless user_signed_in?
  end
end
