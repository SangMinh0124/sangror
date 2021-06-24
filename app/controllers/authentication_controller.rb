class AuthenticationController < ApplicationController
  skip_before_action :authenticate!, only: [:login, :refresh_token]

  def login
 	@user = User.find_by_username(params[:name])
 	if @user && @user.authenticate(params[:password_digest])
 		auth_token = JsonWebToken.encode(user_id: @user.id)

   		 hash_authen = {
    	  status: true,
    	  token: auth_token
    		}
    render json: hash_authen , status: :ok
	else
	render json: { error: 'unauthorized' }, status: false
	end

  end

  def logout
    token = request.headers['Authorization']
    token ? token.destroy : raise(ExceptionHandler::AuthenticationError)
  end

  private
  def auth_params
    params.permit(:name, :password_digest)
  end

  def refresh_token_param
    params.permit(:refresh_token)
  end
end
