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
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def buy_now
    @user = current_user
  end

  private
    def product_params
      params.require(:product).permit(:name, :details, :price, :quantity, :category_id)
    end
end
