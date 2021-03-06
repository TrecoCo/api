# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :first_name, :email, :cpf, :mobile_phone,
            :birth_date, presence: true
  validates :email, uniqueness: true
  validates :mobile_phone, :cpf, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, if: :password
  validates :cpf, length: { is: 11 }
end
