class Api::V1::AddressesController < ApplicationController
    def index
	  render json: current_user.addresses.as_json(include: :address_type)
	end

		def show
			render json: Address.find(params[:id]).as_json(include: :address_type)
		end

		def create
			address=Address.new(address_params)
			address.user_id=current_user.id
			if address.save
				render json: {success: true}
			else
				not_found
			end
		end

		def update
			address=Address.find(params[:id])
			if address.update(address_params)
				render json: {success: true}
			else
				not_found
			end
		end
		
		private

		def address_params
			params.require(:address).permit(:name,:address,:state,:pincode,:mobile,:city,:address_type_id,:locality)
		end
end
