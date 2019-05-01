# frozen_string_literal: true

module Authenticable
  extend ActiveSupport::Concern

  def encode(payload)
    JWT.encode(payload, ENV['JWT_SECRET'])
  end

  def decode(token)
    JWT.decode(token, ENV['JWT_SECRET']).first.dig('user_id')
  end

  def authenticate_request
    @current_user ||= User.find(user_id)
  rescue StandardError
    head :unauthorized
  end

  def authenticate_user
    user = User.find_by(email: authentication_params[:email])

    user.try(:authenticate, authentication_params[:password])
  end

  private

  def token
    @token ||= request.headers['Authorization']&.split(' ')&.last
  end

  def user_id
    @user_id ||= decode(token)
  end
end
