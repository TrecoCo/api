# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :fetch_user, only: %i[update destroy]

      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors.full_messages, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: @user, status: :ok
        else
          render json: @user.errors.full_messages, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy

        head :no_content
      end

      private

      def user_params
        params.require(:user).permit(
          :first_name,
          :last_name,
          :email,
          :password,
          :cpf,
          :mobile_phone,
          :birth_date
        )
      end

      def fetch_user
        @user = User.find(params[:id])
      end
    end
  end
end
