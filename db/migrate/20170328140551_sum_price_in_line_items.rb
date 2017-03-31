class SumPriceInLineItems < ActiveRecord::Migration[5.0]
  def change
  	LineItem.all.each do |item|
  		item.update_attribute :price, item.product.price
  	end	
  end

end
