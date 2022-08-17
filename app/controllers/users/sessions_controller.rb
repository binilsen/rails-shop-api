# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(_resource, _opt = {})
      return render json: { message: 'Signed in!' }, status: :ok if current_user

      render json: { error: 'Auth error.' }, status: :unauthorized
    end

    def respond_to_on_destroy
      log_out_success && return if current_user

      log_out_failure
    end

    def log_out_success
      render json: { message: 'You are logged out.' }, status: :ok
    end

    def log_out_failure
      render json: { error: 'Error occurred' }, status: :unauthorized
    end
  end
end