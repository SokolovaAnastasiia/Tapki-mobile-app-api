class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    user = User.new(user_params)

    if user.save
      # Generate a new JWT token
      auth_token = JsonWebToken.encode({ user_id: user.id })

      # Return the auth token in the response
      render json: { auth_token: auth_token, status: 'User created successfully' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
