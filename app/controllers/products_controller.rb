class ProductsController < ApplicationController
  def index
    if current_user.seller?
      @products = current_user.products
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
 
  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def buy_now
    @product = Product.find(params[:id])
    quantity = @product.quantity
    updated_quantity = (quantity - params[:quantity].to_i)

    product = @product
    ordered_item = OrderItem.create(name: product.name, price: product.price, quantity: params[:quantity].to_i, order_id: current_user.orders.ids.first)

    @product.update(quantity: updated_quantity)
  end

  def my_order
    @ordered_items = OrderItem.all
  end

  def add_to_cart
    product = Product.find(params[:id])
    cart_item = CartItem.create(name: product.name, price: product.price,
    quantity: 1, cart_id: current_user.cart.id)
    
    redirect_to carts_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :details, :price, :quantity, :category_id, :image)
    end
end
