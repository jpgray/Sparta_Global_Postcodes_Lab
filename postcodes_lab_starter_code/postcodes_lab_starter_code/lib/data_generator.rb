require 'httparty'


class Data_generator
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def generate_postcode
    JSON.parse(self.class.get("/random/postcodes").body)["result"]["postcode"]
  end

  def generate_postcodes
    ran_num = 2 + rand(9)
    generated_array = []
    while generated_array.length < ran_num
      generated_array << generate_postcode
    end
    generated_array
  end
end
