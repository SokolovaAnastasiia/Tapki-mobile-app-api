  class SessionsController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    def create
      user = User.find_by(email: params[:email])
  
      if user&.authenticate(params[:password])
        token = Token.encode({ user_id: user.id })
        render json: { token: token, status: 'Logged in successfully' }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    def destroy
      # Implement your logout logic here
      render json: { status: 'Logged out successfully' }, status: :ok
    end
  end
  