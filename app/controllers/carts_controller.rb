class CartsController < ApplicationController
  def index
    @cart_items = current_user.cart.cart_items
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to root_path
  end
end
