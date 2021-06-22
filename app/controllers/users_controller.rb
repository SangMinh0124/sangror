class UsersController < ApplicationController
    # POST /signup
    def create
        @user = User.new(user_params)
        if @user.save
          render json: serializer.new(@user), status: :created
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
    end
  
    private

    def user_params
      params.permit(:username,:password)
    end

    def serializer
        UserSerializer
    end
end