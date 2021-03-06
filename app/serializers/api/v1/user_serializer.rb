# frozen_string_literal: true

module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :first_name, :last_name, :email, :cpf,
                 :mobile_phone, :birth_date
    end
  end
end
