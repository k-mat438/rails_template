# frozen_string_literal: true

class CartProductsController < ApplicationController
  def index
    @cart_products = @current_cart.cart_products.all
  end

  def create
    @cart_product = @current_cart.cart_products.find_by(product_id: params[:product_id])
    # カートの中に同じ商品がある場合とない場合
    unless @cart_product
      @cart_product = @current_cart.cart_products.build(product_id: params[:product_id])
      @cart_product.save
    end
    @cart_product.increment!(:quantity, 1)
    redirect_to cart_products_path
  end
end
