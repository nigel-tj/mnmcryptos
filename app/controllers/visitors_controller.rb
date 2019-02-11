require 'rest-client'
require 'json'
require 'rss'
require 'open-uri'

class VisitorsController < ApplicationController
  
  def index
    puts "Running Index"
    @response_json = RestClient.get 'https://api.coinmarketcap.com/v2/ticker/?limit=10'

    @data_json = JSON.parse(@response_json.body)
    puts "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH #{@data_json}"
    @data = @data_json["data"].values
    puts "HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH #{@data}"
    #RSS FEED
    @rss_results = []
    @rss = RSS::Parser.parse(open('https://cryptocurrencynews.com/feed/').read, false).items[0..5]                                                                         
    
    @rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: result.description }
      @rss_results.push(result)
    end
    puts "#{@rss_results}"
    @rss_results
  end
end
