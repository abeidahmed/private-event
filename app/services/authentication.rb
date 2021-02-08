class Authentication
  def initialize(params)
    @name = params[:name]
  end

  def authenticated?
    !!user
  end

  def user
    @user ||= User.find_by(name: @name)
    return unless @user
  end
end
