class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  #rescue method
  def record_not_found
      flash[:alert] = "The page you were looking for wasn't found!"
      redirect_to root_path
  end

    #Controller Helper
    def translation_status
        translation_or_error = Api.translate(@classic)
        if translation_or_error.include?("Too Many Requests:")
            flash[:alert] = translation_or_error
            redirect_to classics_path
        elsif translation_or_error.include?("Not Found")
            flash[:alert] = "Please remove any spaces or enters from the end of your submission."
            redirect_to new_classic_path
        else
            @classic.translation = translation_or_error
            @classic.save
            flash[:message]="Successfully added Classic Literature to the database!"
            redirect_to classic_path(@classic)
        end
    end
    def translation_denied
        flash[:alert]="There was an issue translating your submission. Please Try Again"
        redirect_to classics_path
    end

    def validate_classic_edit(classic)
        if params[:author_id]
            author = Author.find_by(id: params[:author_id])
            if author.nil?
              flash[:alert] = "Author not found in Database."
              redirect_to authors_path
            else
              classic = author.classics.find_by(id: params[:id])
              if classic.nil?
                flash[:alert] = "You are trying to edit a Classic that does not exist." 
                redirect_to author_classics_path(author)
              else
                classic = Classic.find(params[:id])
              end
            end
          end
    end
end
