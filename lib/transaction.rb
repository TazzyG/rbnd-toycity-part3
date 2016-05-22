require 'json'

class Transactions
	# joins the customers and products, to show which customers have purchased which products.
	attr_reader :product, :customer, :id

	@@transcations = []

  def initialize(options={})
  	# @title = options[:title]
  	add_to_transactions
  end
  def self.all
  	@@transactions
  end

  def purchase
  	# stock needs to decrease by 1 for every item purchases
  	remove_from_stock
  end

  private 

  def add_to_transactions
  	#if # criteria for unique product
  		@@transactions << self
  	#else
  		#raise DuplicateProductError
  	#end
  end
  def remove_from_stock
  	# stock levels are private

  end
end
