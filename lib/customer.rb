class Customer

	attr_reader :name 

	@@customers = []

	def initialize(options={})
	  	@name = options[:name]
	  	add_to_customers
	end

	def self.all
		@@customers
	end

  def self.find_by_name(search_criteria)
  	# return a single customer based on his/her name
  	@@customers.map do |customer|
  		if customer.name == search_criteria
  			return customer
  		end
  	end
  end

  def purchase(product)
    if product.in_stock?
      Transaction.new(self.name, product)
    else
      raise OutofStockError, "#{product.title} is out of stock"
    end
  end

  private

  def add_to_customers
  	
  	unless @@customers.map{|customer|customer.name}.include? @name
  		@@customers << self
    else
			raise DuplicateCustomerError, "#{@title} already exists."
		end
  end
end