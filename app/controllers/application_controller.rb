class ApplicationController < ActionController::API
    # include ActionController::RequestForgeryProtection
  
    # protect_from_forgery with: :null_session, if: -> { request.format.json? }

    before_action :authenticate_request

    private

    def authenticate_request
      auth_header = request.headers['Authorization']
      token = auth_header.split(' ').last if auth_header
      @decoded_payload = Token.decode(token) if token

      render json: { error: 'Not Authorized' }, status: :unauthorized unless @decoded_payload
    end

    def current_user
      @current_user ||= User.find(@decoded_payload[:user_id]) if @decoded_payload
    end

  end
  