require 'httparty'
require 'json'

class Postcodesio
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_multiple_postcodes(postcodes_array)
    JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes_array}).body)
  end

  def get_status(response)
    response["status"]
  end

  def get_result(response)
    response["result"]
  end

  def get_results_array (response)
    results_array = []
    response["result"].each do |result|
      results_array << result["result"]
    end
    results_array
  end

  def get_postcode(response)
    postcode = get_result(response)["postcode"]
    trim_postcode (postcode)
  end

  def trim_postcode (postcode)
    postcode.gsub(" ","")
  end
end

# @postcodesio = Postcodesio.new
# @response = @postcodesio.get_multiple_postcodes(['KT19 8JG', 'KT18 2DJ']) #Add in array of postcodes
# @response_result_to_check = @postcodesio.get_result(@response)[0]["result"]
# puts @response_result_to_check
# puts @response
# puts @postcodesio.get_results_array(@response)
