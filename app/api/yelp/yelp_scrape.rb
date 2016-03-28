module Yelp
  class YelpScrape
    attr_accessor :term, :city, :yelp_client, :driver, :phone_numbers

    def initialize(term:, city:)
      @term = term
      @city = city
      @yelp_client = YelpConnect.get_client
      @driver = Selenium::WebDriver.for :phantomjs
      @phone_numbers = []
    end

    def execute
      search
      navigate_results
      @phone_numbers
    end

    private

    def total_reps
      @yelp_client.search('Austin Tx', { term: @term }).total/10
    end

    def next_page
    	@driver.find_element(:css, ".next")
    end

    def numbers
    	@driver.find_elements(:class, "biz-phone")
    end

    def search
      @driver.get "http://yelp.com"
      search_term = @driver.find_element(:id, "find_desc")
      search_term.send_keys(@term)

      search_location = @driver.find_element(:id, "dropperText_Mast")
      search_location.clear
      search_location.send_keys(@city)

      submit_search = @driver.find_element(:id, "header-search-submit")
      submit_search.click
    end

    def navigate_results
      total_reps.times do
      	numbers.each{|n| @phone_numbers << n.text.gsub("-", "").gsub(" ", "").gsub("(", "").gsub(")", "")}
      	next_page.click
      end
    end
  end
end
