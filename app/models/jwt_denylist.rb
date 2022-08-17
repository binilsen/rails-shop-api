# frozen_string_literal: true

# Revoke JWT token on user logout and store it.
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylists'
end
