class YelpWorker
	include Sidekiq::Worker

	def perform(city_id)
    @city = City.find(city_id)
		phone_numbers = Yelp::YelpScrape.new(term: "screen-printing", city: @city.name).execute
    @client = Yelp::YelpConnect.get_client

    phone_numbers.each do |phone|
      printer = Printer.new
      data = @client.phone_search(phone)
      next if data.businesses.first == nil
      printer.city_id = @city.id
      printer.company = data.businesses.first.id
      printer.number = data.businesses.first.display_phone
      printer.address = data.businesses.first.location.display_address
      printer.rating = data.businesses.first.rating
      printer.url = data.businesses.first.mobile_url
      printer.save
    end
	end
end