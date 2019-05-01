# frozen_string_literal: true

module Api
  module V1
    class BaseController < ActionController::API
      include Authenticable

      before_action :authenticate_request
    end
  end
end
