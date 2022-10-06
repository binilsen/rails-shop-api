class AddressType
  include Mongoid::Document
  include Mongoid::Timestamps
  field :type, type: String
  field :time, type: String
  has_one :address
end
