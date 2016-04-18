# Connection Wrapper

###Description
Connection Wrapper is a simple API wrapper written for a hypothetical API. It can easily be modified and used to work with any existing get only API. 

###Initial Dependancies.
Library is written in ruby 2.2.2. You must also have bundler installed previously to run the code.
Other dependencies are handled by bundler. 

###Running The App


1. Clone the repo
2. Change directory to local repo
3. Bundle install to get all gems (all dependencies listed in the gemfile)
4. Run 'rake' from the root directory to run the test suite. 

###Using the Library

####Making a request. 
1. Create an instance of Connection::Customer_rating by calling.
```ruby
con = Connection::Customer_rating.new(40000, 60626, 25)
```
This will create a new customer rating object that is initialized with an income of 40000, zip of 60626 and age of 25. 
2. You can then make the get request by calling 
```ruby
con.information
```

####Interacting With The objects.
1. You can call any method present in the information hash directly on the customer_rating object. That means that in the previous example calling 
```ruby
con.propensity
```
will give you the propensity of that consumer_rating. 

2. If a method called on object does not exist in the hash it will return a standard NoMethodError.