class Transaction
	# joins the customers and products, to show which customers have purchased which products.
	attr_reader :id, :product, :customer

	@@id = 0
	@@transactions = []

  def initialize(customer, product, options = {})
  	@@id += 1
  	@id = @@id	
  	@customer = customer
  	@product = product
  	@product.reduce_stock
  	add_to_transactions
  	
  end

  def self.all
  	@@transactions
  end

  def self.find(id)
  	@@transactions.each do |transaction|
  		transaction if transaction.id == id
  	end
  end


  private 

  def add_to_transactions	
  		@@id += 1
  		@@transactions << self
  end
end
