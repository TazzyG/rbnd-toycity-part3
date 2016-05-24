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
  	@@products.find { |product| product.title == search_criteria}
  end

  def reduce_stock
  	@stock = @stock - 1
  end

  def add_stock
    @stock = @stock + 1

  end

  def self.all
  	@@products
  end 

  def self.in_stock
  	products_in_stock = []
  	@@products.each do |product|
  	# array of all products with stock greater than zero
	  	products_in_stock << product if product.in_stock?
  	end
	  products_in_stock
  end

  def in_stock?
  	# determine whether something is in stock
  	@stock > 0 ? true : false
  end

  def self.find(id)
    @@product.each do |item| 
      return item if item.id == id
    end
  end
  
	private

  def add_to_products
  	existing_title = false
  	@@products.each do |product|
  			existing_title = true if product.title == title
		end
   	if existing_title == false
   		@@products << self
    else
			raise DuplicateProductError, "#{@name} already exists."
		end
  end

end
 
