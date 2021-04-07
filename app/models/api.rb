class Api < ApplicationRecord
    #method that sends information to api
    #method that retrieves information
    #method that assigns to either translation class or yoda column in classics table
    def get_translation
        url = "https://api.funtranslations.com/translate/yoda.json"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

end
