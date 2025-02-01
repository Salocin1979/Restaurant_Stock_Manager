class HomeController < ApplicationController
  def index
    # Exemple d'affichage de données
    @total_products = Product.count
    @products_in_stock = Product.where("quantity > 0").count
    @low_stock_alerts = Product.where("quantity < ?", 5) # Alertes pour produits dont le stock est inférieur à 5
  end
end
