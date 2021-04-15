class ApplicationController < ActionController::Base
    include ApplicationHelper
    #Controller Helper
    def translation_status
        translation_or_error = Api.translate(@classic)
        if translation_or_error.include?("Too Many Requests:")
            flash[:message] = translation_or_error
            redirect_to classics_path
        elsif translation_or_error.include?("Not Found")
            flash[:message] = "Please remove any spaces or enters from the end of your submission."
            redirect_to new_classic_path
        else
            @classic.translation = translation_or_error
            @classic.save
            flash[:message]="Successfully added Classic Literature to the database!"
            redirect_to classic_path(@classic)
        end
    end
    def translation_denied
        flash[:message]="There was an issue translating your submission. Please Try Again"
        redirect_to classics_path
    end
end
