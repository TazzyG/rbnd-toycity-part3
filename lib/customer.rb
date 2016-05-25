class Customer

	attr_reader :name, :id, :ref

	@@customers = []
  @@id = 0

	def initialize(options = {})
      @@id += 1
      @id = @@id
	  	@name = options[:name]
	  	add_to_customers
	end

	def self.all
		@@customers
	end

  # suggested improvement
  def self.find_by_name(search_criteria)
    @@customers.find { |product| product.name == search_criteria }
  end

  # original code

  # def self.find_by_name(search_criteria)
  # 	# return a single customer based on his/her name
  # 	@@customers.map do |customer|
  # 		if customer.name == search_criteria
  # 			return customer
  # 		end
  # 	end
  # end

  def find_transactions
    customer = self
    Transaction.find_by_customer(customer)
  end
  def purchase(product)  
      refdoc = "purchase_order_num"
      Transaction.new(self, product, refdoc)
      #puts "Thanks for your Purchase"
  end 

  def return(product)    
    refdoc = "return_auth_num"
    Transaction.new(self, product, refdoc)  
    #puts "Your product has been returned"
  end  

  # need something to be able to match the customer to transaction and other objects in future?
  def self.find(id)
    @@customers.each do |person| 
      return person if person.id == id
    end
  end

  def find_name_by_id(id)
    @@customers.each do |person|
      return person.name if person.id == id
    end
  end

  private

  def add_to_customers
    # @@customer.each do |customer|
    #   customer.name == @name
    # above did not work
    if @@customers.map(&:name).include? @name
      raise DuplicateCustomerError, "#{@name} already exists."
    else        
      @@customers << self
    end
  end
end