module ApplicationHelper

    def page_title_tag
        title = "Shobo練"
        title = @page_title + "|" + title if @page_title
        title
    end

end
