# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe BaseController, type: :controller do
      describe '#authenticate_request' do
        let!(:user) { create(:user) }

        controller do
          def index
            head :ok
          end
        end

        context 'when token is present and it is valid' do
          it 'returns 200 http status' do
            request.headers.merge(authenticated_header(user))
            get :index

            expect(response).to have_http_status(:ok)
          end
        end

        context 'when token is not valid' do
          it 'returns 401 http status' do
            request.headers.merge(Authorization: nil)
            get :index

            expect(response).to have_http_status(:unauthorized)
          end
        end
      end
    end
  end
end
