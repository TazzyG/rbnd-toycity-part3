require 'json'

class Customers
	attr_reader :name 

 def initialize(options={})
  	@name = options[:name]
  	add_to_customers
  end
  def self.all
  	@@customers
  end
  def find_by_name
  	# return a single product based on its title
  end

  private
  def add_to_customers
  	#if # criteria for unique product
  		@@customers << self
  	#else
  		#raise DuplicateProductError
  	#end
  end
end