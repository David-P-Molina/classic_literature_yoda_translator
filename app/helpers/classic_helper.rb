module ClassicHelper
    #view Helper
    def author_id_field(classic)
        if classic.author.nil?
            select_tag "classic[author_id]", options_from_collection_for_select(Author.all, :id, :name)
        else
            hidden_field_tag "classic[author_id]", classic.author_id
        end
    end
end