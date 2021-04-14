require_relative '../../config/environment.rb'
class Api < ApplicationRecord
    def self.format_url(content)
        "https://api.funtranslations.com/translate/yoda.json?text=" + URI::Parser.new.escape(content)
    end
    
    def self.translate(classic)#individual translation       
        url = format_url(classic.content)
        classic.translation = retrieve_translation(url)
    end
    
    def self.translate_all
        Classic.all.each do |classic|
            if classic.translation.nil?
                self.translate(classic)
            end
        end
    end
    
    
    def self.process_translation(url)
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
    end
    def self.retrieve_translation(url) 
        info = JSON.parse(self.process_translation(url))
        if info.include?("error")
            # info['error']['message']
  
        else
            info['contents']['translated'] 
        end
    end
end

Api.translate_all