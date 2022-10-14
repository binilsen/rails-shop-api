class Overrides::TokenValidationsController < DeviseTokenAuth::TokenValidationsController
    def validate_token
        if @resource
            cart=@resource.carts[0]
            items = if cart.blank?
                        nil
                    else
                        cart.carts_products
                    end
            render json:{
                data: @resource, cart:,carts_products: items
            }
        else
            render json:{
                success: false,
                error: ['Invalid token']
            }, status: 401
        end
    end
end
