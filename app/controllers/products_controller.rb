class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :find_product, :buy_now, :add_to_cart]
  
  def index
    if current_user.seller?
      @products = current_user.products
    else
      @products = Product.all
    end
  end

  def show
  end

  def find_product
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
    quantity = @product.quantity
    updated_quantity = (quantity - params[:quantity].to_i)

    ordered_item = OrderItem.create(name: @product.name, price: @product.price, quantity: params[:quantity].to_i, order_id: current_user.orders.ids.first)

    @product.update(quantity: updated_quantity)
  end

  def search
    @products = Product.search(params[:query])
    @categories = Category.joins(:products).where(:products => {:id => @products.map{|x| x.id }}).distinct
  end

  def my_order
    @ordered_items = OrderItem.all
  end

  def add_to_cart
    cart_item = CartItem.create(name: @product.name, price: @product.price,
    quantity: 1, cart_id: current_user.cart.id)
    
    redirect_to carts_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :details, :price, :quantity, :category_id, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end