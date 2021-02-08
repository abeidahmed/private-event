module Requests
  module SessionsHelper
    def sign_in(user = nil)
      user ||= create(:user)
      cookies[:auth_token] = user.id
    end
  end
end
