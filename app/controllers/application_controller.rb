# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::MimeResponds

  respond_to :json

  private

  def user_cart
    current_user.carts.order(created_at: :desc).find_by(proccessed: false)
  end

  def not_found
    render json: {error: true, message: 'Internal error!'}
  end
end
