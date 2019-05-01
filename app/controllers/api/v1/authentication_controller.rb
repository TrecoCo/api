# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < BaseController
      include Authenticable

      skip_before_action :authenticate_request, only: %i[create]

      def create
        if user
          render json: { user: UserSerializer.new(user), token: token }, status: :ok
        else
          head :unauthorized
        end
      end

      private

      def authentication_params
        params.require(:authentication).permit(:email, :password)
      end

      def user
        @user ||= authenticate_user
      end

      def token
        @token ||= encode(user_id: user.id)
      end
    end
  end
end
