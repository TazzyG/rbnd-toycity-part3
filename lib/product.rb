class Product
	attr_reader :title, :price, :stock 
	
	@@products = []

  def initialize(options={})
  	@title = options[:title]
  	@price = options[:price]
  	@stock = options[:stock]	
  	add_to_products
  end
	def self.find_by_title(search_criteria)
  	# return a single product based on its title
  	@@products.map do |product|
  		if product.title == search_criteria
  			return product
  		end
  	end
  end

  def self.all
  	@@products
  end
  
  def self.in_stock
  	products_in_stock = []
  	@@products.map do |product|
  	# array of all products with stock greater than zero
	  	if product.in_stock?
	  		products_in_stock << product
	  	end
	  end
  end

  def in_stock?
  	# determine whether something is in stock
  	@stock > 0 ? true : false
  end
  
	private

  def add_to_products
  	
  	unless @@products.map{|product|product.title}.include? @title
  		@@products << self
    else
			raise DuplicateProductError, "#{@name} already exists."

		end
  end

end
 
