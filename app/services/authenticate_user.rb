class AuthenticateUser
  include Base

  attr_reader :username, :password

  def initialize(username, password)
    @username = username
    @password = password
  end

  def perform!
    AuthToken.generate! user
  end

  private
  def user
    user = User.find_by(username: username)
    return user if user && user.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
