class OrdersController < ApplicationController
  def new
    @order = Order.new
    @suppliers = Supplier.all
    @products = Product.all
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path, notice: "Commande créée avec succès."
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:supplier_id, :product_id, :quantity, :price, :status)
  end
end
