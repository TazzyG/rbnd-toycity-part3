class Transaction
	# joins the customers and products, to show which customers have purchased which products.
	attr_reader :customer, :product, :id

	@@transactions = []
	@@id = 0
  

  def initialize(customer, product)
  	@@id += 1
  	@id = @@id	
  	@customer = customer
  	@product = product
  	@product.reduce_stock
  	add_to_transactions
  end

  def add_to_transactions	
  		@@transactions << self
  end

  def id
  	@id
  end

  def self.find_by_customer(customer)
    customer_transactions = []
    @@transactions.each do |transaction|
    # create an array of transactions for the customer
      customer_transactions << transaction if transaction.customer == customer
    end
    customer_transactions
  end



  def self.all
  	@@transactions
  end
  
  # need something to be able to match the transaction to the product or customer
  def self.find(id)
  	@@transactions.each do |record|
  		return record if record.id == id
  	end
  end

  private
  def identify_customer
    @customer = Customer.find_by_name(customer.name)
  end
  
end
