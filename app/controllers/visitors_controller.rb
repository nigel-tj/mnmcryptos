require 'rest-client'
require 'json'

class VisitorsController < ApplicationController
  
  def index
    puts "Running Index"
    @response_json = RestClient.get 'https://api.coinmarketcap.com/v2/ticker/?limit=5'

    @data_json = JSON.parse(@response_json.body)
    puts "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH #{@data_json}"
    @data = @data_json["data"].values
    puts "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH #{@data}"
  end
end
