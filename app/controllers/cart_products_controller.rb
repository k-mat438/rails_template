# frozen_string_literal: true

class CartProductsController < ApplicationController
  def index
    @cart_products = @current_cart.cart_products.all
    @subtotal = @current_cart.total_amount
    @order = Order.new(flash[:order])
  end

  def create
    @cart_product = @current_cart.cart_products.find_by(product_id: params[:product_id])
    # カートの中に同じ商品がある場合とない場合
    @cart_product ||= @current_cart.cart_products.create(product_id: params[:product_id])
    if params[:quantity]
      # 数量指定で追加
      @cart_product.increment(:quantity, params[:quantity].to_i)
    else
      # ひとつ追加
      @cart_product.increment(:quantity, 1)
    end
    @cart_product.save
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = @current_cart.cart_products.find_by(product_id: params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end
end
