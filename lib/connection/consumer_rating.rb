module Connection
  class Consumer_rating

  	include HTTParty

  	base_uri 'http://not-real.com'

  	attr_accessor :income
  	attr_accessor :age
  	attr_accessor :zip

  	def initialize(income, zip, age)
  		self.income = income
  		self.zip = zip
  		self.age = age
  	end

  	def information
  		self.class.get "/customer_scoring?income=#{self.income}&zipcode=#{self.zip}&age=#{self.age}"
  	end

  	def method_missing(name, *args, &block)
  		if information.has_key?(name.to_s)
   			information[name.to_s]
  		else
    		super
  		end
		end

  end
end