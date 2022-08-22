# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(_resource, _opt = {})
      if current_user
        image = current_user.avatar.attached? ? rails_blob_url(current_user.avatar) : nil
        return render json: { message: 'Signed in!', image:, username: current_user.email },
                      status: :ok
      end

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
