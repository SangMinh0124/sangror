class AuthenticationController < ApplicationController
  skip_before_action :authenticate!, only: [:login, :refresh_token]

  def login
    auth_token =
      AuthenticateUser.new(auth_params[:name], auth_params[:password_digest]).perform!
    hash_authen = {
      status: true,
      token: auth_token
    }
    render json: hash_authen , status: :ok
  end

  def logout
    token = AuthToken.find_by token: request.headers['Authorization']
    token ? token.destroy : raise(ExceptionHandler::AuthenticationError)
  end

  def refresh_token
    token = AuthToken.find_by refresh_token: refresh_token_param[:refresh_token]
    token ? token.renew! : raise(ExceptionHandler::AuthenticationError)
    render json: token, status: :ok
  end

  private
  def auth_params
    params.permit(:name, :password_digest)
  end

  def refresh_token_param
    params.permit(:refresh_token)
  end
end
