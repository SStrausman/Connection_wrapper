require_relative '../../spec_helper'

describe Connection::Consumer_rating do

	describe "be configured correctly" do

		it "must include httparty methods" do
			Connection::Consumer_rating.must_include HTTParty
		end

		it "must have correct base URL" do
			Connection::Consumer_rating.base_uri.must_equal 'http://not-real.com'
		end

	end

	describe "default instance attributes" do

		before do 
			response = { "propensity" => 0.26532, "ranking" => "C" }.to_json
			stub_request(:any, "http://not-real.com/customer_scoring?age=25&income=40000&zipcode=60625").to_return(:body => response, :status => 200,
				:headers => {'Content-Type' => 'application/json'})
		end

		let(:consumer_rating) { Connection::Consumer_rating.new(40000, 60625, 25) }

		it "must have an id attribute" do
			consumer_rating.must_respond_to :income
		end

		it "must have the right income" do
			consumer_rating.income.must_equal 40000
		end

	end

	describe "GET information" do

		before do 
			response = { "propensity" => 0.26532, "ranking" => "C" }.to_json
			stub_request(:any, "http://not-real.com/customer_scoring?age=25&income=40000&zipcode=60625").to_return(:body => response, :status => 200,
				:headers => {'Content-Type' => 'application/json'})
		end

		let(:consumer_rating) { Connection::Consumer_rating.new(40000, 60625, 25) }

		it "must have a information method" do
			consumer_rating.must_respond_to :information
		end

		it "must parse the api response from JSON to Hash" do
			consumer_rating.information.must_be_instance_of Hash
		end

		it "must perform the request and get the data" do
			consumer_rating.information["propensity"].must_equal 0.26532
		end

		describe "dynamic attributes" do

			before do
				consumer_rating.information
			end

			it "must return the attribute value if present in profile" do
				consumer_rating.ranking.must_equal "C"
			end

			it "must raise method missing if attribute is not present" do
				lambda { consumer_rating.hair_color }.must_raise NoMethodError
			end

		end

	end

end