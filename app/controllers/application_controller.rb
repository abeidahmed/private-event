class ApplicationController < ActionController::Base
  add_flash_types :error, :success

  include SessionsHelper
end
