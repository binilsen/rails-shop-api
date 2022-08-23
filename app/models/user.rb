# frozen_string_literal: true

# User model for authentication and  revocation strategy
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_one_attached :avatar

  validates :avatar, content_type: ['image/png', 'image/jpeg'],
                     size: { less_than: 1.megabytes, message: 'is too large' }
end
