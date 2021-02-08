class SessionsController < ApplicationController
  def new
    render layout: 'slate'
  end

  def create
    @user = Authentication.new(user_params)

    if @user.authenticated?
      sign_in(@user.user)
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid name'
      render :new
    end
  end
end
