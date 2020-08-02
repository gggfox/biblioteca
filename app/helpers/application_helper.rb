module ApplicationHelper

    def complete_title(page_title = '' )
        default_title = "Biblioteca"
        if page_title.empty?
            default_title
        else
            page_title + " | " + default_title
        end
    end
end
