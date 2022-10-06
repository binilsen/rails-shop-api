class Address
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :address, type: String
  field :state, type: String, default: 'KL'
  field :pincode, type: Integer
  field :mobile, type: String
  field :city, type: String
  field :locality, type: String
  index({address:1},{unique: true,name: "add_index_address"})
  belongs_to :address_type
  belongs_to :user
  has_many :orders
end
