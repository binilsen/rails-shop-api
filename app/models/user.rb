# frozen_string_literal: true

# User model for authentication and  revocation strategy
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  field :email, type: String, default: ''
  field :encrypted_password, type: String, default: ''
  field :reset_password_token, type: String
  field :remember_created_at, type: DateTime
  field :reset_password_sent_at, type: DateTime
  slug :email
  index({ email: 1 }, { unique: true, name: 'index_user_on_email' })
  index({ reset_password_token: 1 }, { unique: true, name: 'index_user_on_rpt' })
  index({ slug: 1 }, { unique: true, name: 'index_user_on_slug' })

  include Mongoid::Locker

  field :locker_locked_at, type: Time
  field :locker_locked_until, type: Time

  locker locked_at_field: :locker_locked_at,
         locked_until_field: :locker_locked_until

  ## Required
  field :provider, type: String
  field :uid,      type: String, default: ''

  ## Tokens
  field :tokens, type: Hash, default: {}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :carts
  index({ uid: 1, provider: 1 }, { name: 'uid_provider_index', unique: true, background: true })
end
