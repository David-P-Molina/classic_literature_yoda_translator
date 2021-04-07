require_relative '../../config/environment.rb'
class Api 
   
   def self.set_classic(content)
       "https://api.funtranslations.com/translate/yoda.json?text=" + URI::Parser.new.escape(content)
   end
    def self.start_translation
        Classic.all.each do |classic|
            url = set_classic(classic.content)
            classic.translation = yoda_translation(url)
        end
    end

    def self.get_translation(url)
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
    end
    def self.yoda_translation(url) #set
        classic_info = JSON.parse(self.get_translation(url))
        classic_info['contents']['translated'] 
    end
end
{
    {"success": {"total": 1},"contents": {"translated": "If there is some mistake,  to ask","text": "To ask if there is some mistake","translation": "yoda"}}
Api.start_translation