class Product
	attr_reader :title

	@@products = []

  def initialize(options={})
  	@title = options[:title]
  	add_to_products
  end
  def find_by_title
  	# return a single product based on its title
  end
  def in_stock?
  	# determine whether or not the item is in stock
  end
  def self.all
  	@@products
  end

  private
  def products_in_stock
  	# array of all products with stock greater than zero
  	#@@products_instock = []
  end

  def add_to_products
  	#if # criteria for unique product
  		@@products << self
  	#else
  		#raise DuplicateProductError
  	#end
  end
end