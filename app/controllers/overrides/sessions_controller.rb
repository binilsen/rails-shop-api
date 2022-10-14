class Overrides::SessionsController < DeviseTokenAuth::SessionsController
  def render_create_success
    if @resource
      render json: {
        success: true,
        cart: current_user.carts.order(created_at: :desc).find_by(proccessed: false).as_json(include: :carts_products),
        user: current_user
      }
    end
  end
end
