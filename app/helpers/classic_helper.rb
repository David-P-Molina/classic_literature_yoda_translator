module ClassicHelper
    def author_id_field(classic)
        if !classic.author.nil?
            hidden_field_tag "classic[author_id]", classic.author_id
        else
            select_tag "classic[author_id]", options_from_collection_for_select(Author.all, :id, :name), :include_blank => true 
        end
    end
end