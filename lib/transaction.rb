class Transaction
	# joins the customers and products, to show which customers have purchased which products.
	attr_reader :id, :product, :customer

	@@id = 1
	@@transactions = []

  def initialize(customer, product, options = {})
  	@customer = customer
  	@product = product
  	@id = @@id
  	@@id += 1
  	# @purchase = options[:purchase]
  	# @return_purchase = options[:return_purchase]
  	# remove_from_stock if option[:purchase]
  	# add_to_stock if option[:return_purchase]
  	add_to_transactions
  end

  def self.all
  	@@transactions
  end

  def self.find(select_id)
  	@@transactions.map do |transaction|
  		transaction if transation.id == select_id
  	end
  end
  def purchase
  	# stock needs to decrease by 1 for every item purchases
  	remove_from_stock
  end
  def remove_from_stock
  	product.stock = product.stock -1 
  end

  def add_to_stock
  	product.stock = product.stock +1
  end

  private 

  def add_to_transactions	
  		@@id += 1
  		@@transactions << self
  end
  def remove_from_stock
  	# stock levels are private

  end
end
