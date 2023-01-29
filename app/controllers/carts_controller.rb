class CartsController < ApplicationController
  def index
    @cart_items = current_user.cart.cart_items
    price = @cart_items.pluck(:price)
    @total_price = price.sum
  end

  def cart_item_quantity
    @cart_item = CartItem.find(params[:id])
    quantity = @cart_item.quantity

    if quantity == 1
      updated_quantity = (quantity + 1)

      item_price = @cart_item.price
      updated_item_price = item_price * 2
      @cart_item.update(price: updated_item_price)
    elsif quantity == 2
      updated_quantity = (quantity - 1)
      item_price = @cart_item.price
      updated_item_price = (item_price / 2)
      @cart_item.update(price: updated_item_price)
    else
  end
        
    @cart_item.update(quantity: updated_quantity)
    redirect_to carts_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  def search
    @products = Product.search(params[:query])
    @categories = Category.joins(:products).where(:products => {:id => @products.map{|x| x.id }}).distinct
  end

end
