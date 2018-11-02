module BooksHelper

    def show_title(book)
        html = ''
        if book.info_link && book.title
            html += link_to(book.title.truncate(36), book.info_link)
            html.html_safe
        elsif book.title
            book.title.truncate(36)
        else
            "Title Unavailable"
        end
    end

    def show_authors(book)
        book.authors.join(', ').truncate(36)
    end


end
