# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe 'AuthenticationController', type: :request do
      let!(:user) { create(:user) }

      describe 'POST #create' do
        context 'with valid params' do
          let!(:params) do
            {
              authentication: {
                email: user.email,
                password: user.password
              }
            }
          end

          it 'returns 201 http status' do
            post api_v1_authentication_path, params: params

            expect(response).to have_http_status(:created)
          end

          it 'returns a json with user and token' do
            post api_v1_authentication_path, params: params

            expect(response).to match_response_schema('v1/authentication')
          end
        end

        context 'with invalid params' do
          let(:params) do
            {
              authentication: {
                email: '',
                password: ''
              }
            }
          end

          it 'returns 401 http status' do
            post api_v1_authentication_path, params: params

            expect(response).to have_http_status(:unauthorized)
          end
        end
      end
    end
  end
end
