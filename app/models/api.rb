require_relative '../../config/environment.rb'
class Api 
   
   def self.format_url(content)
       "https://api.funtranslations.com/translate/yoda.json?text=" + URI::Parser.new.escape(content)
   end
    def self.start_translation
        Classic.all.each do |classic|
            if classic.translation.nil?
            url = format_url(classic.content)
            classic.translation = yoda_translation(url)
            end
        end
    end

    def self.get_translation(url)
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
    end
    def self.yoda_translation(url) #set
        byebug
        classic_info = JSON.parse(self.get_translation(url))
        classic_info['contents']['translated'] 
    end
end

Api.start_translation