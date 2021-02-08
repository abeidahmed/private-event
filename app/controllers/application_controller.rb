class ApplicationController < ActionController::Base
  add_flash_types :error, :success

  include SessionsHelper

  protected

  def authenticate_user
    redirect_to root_path unless user_signed_in?
  end
end
