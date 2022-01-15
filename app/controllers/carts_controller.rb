class CartsController < ApplicationController
  def index
    @cart_items = current_user.cart.cart_items
    price = @cart_items.pluck(:price)
    @total_price = price.sum
    
  end

  def update
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to carts_path
  end

end
