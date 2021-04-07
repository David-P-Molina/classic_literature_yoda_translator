class Api < ApplicationRecord
    #method that sends information to api and sets endpoint as url to replace
    # def self.send_classic
        #send to API
        # @url = api_response 
        ##example @url = "https://api.funtranslations.com/translate/yoda.json" #endpoint
    # end
    #method that retrieves information
    # def self.get_translation
        # uri = URI.parse(@url)
        # response = Net::HTTP.get_response(uri)
        # response.body
    # end
    
    #method that assigns to either translation class or yoda column in classics table
    # def self.yoda_translation#if translation class exists
        # classic_info = JSON.parse(self.get_translation)
        #classic = Classic.find(params[:id])
        # classic.translation = classic_info[contents][translated] 
    # end
end
