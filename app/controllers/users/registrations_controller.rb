# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    protected

    def update_resource(resources, params)
      resources.update_without_password(params)
    end
  end
end
