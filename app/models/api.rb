require_relative '../../config/environment.rb'
class Api < ApplicationRecord
    def self.format_url(content)
        "https://api.funtranslations.com/translate/yoda.json?text=" + URI::Parser.new.escape(content)
    end
    
    def self.translate(classic)#individual translation       
        url = format_url(classic.content)
        #if retrieve_translation(url) = 
        translation_or_error = retrieve_information(url)
        translation_or_error
    end
    #may need to remove this method. Based on api calls
    def self.translate_all
        Classic.all.each do |classic|
            if classic.translation.nil?
                classic.translation = self.translate(classic)
            end
        end
    end
    
    
    def self.process_translation(url)
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
    end
    def self.retrieve_information(url) 
        hash = JSON.parse(self.process_translation(url))
        if hash.include?("success")
            hash['contents']['translated'] 
        else
            hash['error']['message']
        end
    end
end

Api.translate_all