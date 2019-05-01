# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe 'UsersController', type: :request do
      describe 'POST #create' do
        context 'with valid params' do
          let(:params) do
            {
              user: attributes_for(:user)
            }
          end

          it 'creates a new user' do
            expect do
              post api_v1_users_path, params: params
            end.to change(User, :count).by(1)
          end

          it 'returns 201 http status' do
            post api_v1_users_path, params: params

            expect(response).to have_http_status(:created)
          end

          it 'returns the created user' do
            post api_v1_users_path, params: params

            expect(response).to match_response_schema('v1/user')
          end
        end

        context 'with invalid params' do
          let(:params) do
            {
              user: {
                first_name: '',
                email: '',
                password: '',
                cpf: '',
                mobile_phone: '',
                birth_date: ''
              }
            }
          end

          it 'does not create a new user' do
            expect do
              post api_v1_users_path, params: params
            end.not_to change(User, :count)
          end

          it 'returns 422 http status' do
            post api_v1_users_path, params: params

            expect(response).to have_http_status(:unprocessable_entity)
          end

          it 'returns the user errors' do
            post api_v1_users_path, params: params

            expect(JSON.parse(response.body)).to match_array(
              [
                "First name can't be blank",
                "Email can't be blank",
                "Password can't be blank",
                "CPF can't be blank",
                'CPF is the wrong length (should be 11 characters)',
                "Mobile phone can't be blank",
                "Birth date can't be blank"
              ]
            )
          end
        end
      end

      describe 'PUT/PATCH #update' do
        let(:user) { create(:user) }

        context 'with valid params' do
          let(:params) do
            {
              user: {
                email: 'new@email.com'
              }
            }
          end

          it 'updates the user' do
            put api_v1_user_path(user),
                headers: authenticated_header(user),
                params: params
            user.reload

            expect(user.email).to eq('new@email.com')
          end

          it 'returns 200 http status' do
            put api_v1_user_path(user),
                headers: authenticated_header(user),
                params: params

            expect(response).to have_http_status(:ok)
          end

          it 'returns the updated user' do
            put api_v1_user_path(user),
                headers: authenticated_header(user),
                params: params

            expect(response).to match_response_schema('v1/user')
          end
        end

        context 'with invalid params' do
          let(:params) do
            {
              user: {
                email: ''
              }
            }
          end

          it 'does not update the user' do
            put api_v1_user_path(user),
                headers: authenticated_header(user),
                params: params
            user.reload

            expect(user.email).not_to eq('new@email.com')
          end

          it 'returns 422 http status' do
            put api_v1_user_path(user),
                headers: authenticated_header(user),
                params: params

            expect(response).to have_http_status(:unprocessable_entity)
          end

          it 'returns the user errors' do
            put api_v1_user_path(user),
                headers: authenticated_header(user),
                params: params

            expect(JSON.parse(response.body)).to match_array(
              [
                "Email can't be blank"
              ]
            )
          end
        end
      end

      describe 'DELETE #destroy' do
        let!(:user) { create(:user) }

        it 'destroys the user' do
          expect do
            delete api_v1_user_path(user), headers: authenticated_header(user)
          end.to change(User, :count).by(-1)
        end

        it 'returns 204 http status' do
          delete api_v1_user_path(user), headers: authenticated_header(user)

          expect(response).to have_http_status(:no_content)
        end
      end
    end
  end
end
