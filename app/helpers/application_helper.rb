module ApplicationHelper

    def new_clubs(clubs)
        clubs.order(id: :desc).limit(3)
    end

    def new_discussions(discussions)
        discussions.order(id: :desc).limit(3)
    end

    def show_current_book_title_and_author(club)
        "#{Book.find(club.shelf.current_book).title} — #{Book.find(club.shelf.current_book).author}"
    end

    def truncate_description(club)
        club.description.truncate(100)
    end

    def show_book_quote(discussion)
        discussion.book_quote if discussion.book_quote
    end

end
