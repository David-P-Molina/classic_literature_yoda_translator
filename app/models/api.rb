require_relative '../../config/environment.rb'
class Api < ApplicationRecord
    def self.format_url(content)
        "https://api.funtranslations.com/translate/yoda.json?text=" + URI::Parser.new.escape(content.gsub(/\r/," ").gsub(/\n/,""))
    end
    
    def self.translate(classic)
        url = format_url(classic.content)
        translation_or_error = retrieve_information(url)
        translation_or_error
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