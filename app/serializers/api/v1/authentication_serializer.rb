# frozen_string_literal: true

module Api
  module V1
    class AuthenticationSerializer < ActiveModel::Serializer
      attributes :token
      attribute :user do
        UserSerializer.new(object[:user])
      end

      def read_attribute_for_serialization(attribute)
        object[attribute]
      end
    end
  end
end
