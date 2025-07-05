module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate_request

      def create
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password]) && user.active
          token = TokenService::WebToken.encode(user_id: user.id)
          render json: { token: token, role: user.role }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end
    end
  end
end
