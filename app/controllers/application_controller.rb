# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::MimeResponds

  respond_to :json

  def user_cart
    current_user.carts.find_by(proccessed: false) || current_user.carts.create 
  end
end
