class Api::V1::AddressTypeController < ApplicationController
    def index
	    render json: AddressType.all
		end
end
