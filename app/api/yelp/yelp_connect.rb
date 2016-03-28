require 'yelp'

	module Yelp
		class YelpConnect
			def self.get_client
				Yelp::Client.new({  
					consumer_key: "9j1jvRw9C8sk35Ivb3_52Q",
          consumer_secret: "rsDk7y1ytiDirNSkCxLAdYO-FiU",
          token: "H_A57-Cu64k4hARpw10o587qX2FCOaUE",
          token_secret: "FyZ7v4Pldf29dMGEPuzg7CLBlds"
		    })
			end
		end
	end