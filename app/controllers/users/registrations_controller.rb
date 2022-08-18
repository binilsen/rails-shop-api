# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      register_success && return if resource.persisted?

      register_failed
    end

    def register_success
      return render json: { message: 'Account updated' } if current_user

      render json: { message: 'Signed up sucessfully.' }
    end

    def register_failed
      render json: { message: 'Something went wrong.' }
    end

    protected

    def update_resource(resources, params)
      resources.update_without_password(params)
    end
  end
end
