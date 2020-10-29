class Library
    attr_reader :name, :books, :authors, :checked_out_books
    
    def initialize(name)
        @name = name
        @books = []
        @authors = []
        @checked_out_books = []
        @popular_book_stats = {}
    end

    def add_author(author)
        @authors << author
        add_books(author)
    end

    def add_books(author)
        author.books.each do |book|
            @books << book
        end
    end

    def publication_time_frame_for(author)
        date_collection = list_of_dates(author)
        breakdown = {start: date_collection.first.to_s, end: date_collection.last.to_s}
    end

    def list_of_dates(author)
        list_of_dates = author.books.map do |book|
            book.publication_year.to_i
        end.sort
    end
    
    def checkout(book)
        if can_be_checked_out?(book) == true
            @checked_out_books << book
            update_popular_book_stats(book)
            return true 
        end
        false
    end

    def update_popular_book_stats(book)
        if @popular_book_stats[book]
            @popular_book_stats[book] += 1
        else
            @popular_book_stats[book] = 1
        end
    end

    def can_be_checked_out?(book)
        @checked_out_books.include?(book) == false && @books.include?(book) == true
    end

    def return(book)
        book_index = @checked_out_books.index(book)
        @checked_out_books.delete_at(book_index)
    end

    def most_popular_book
        @popular_book_stats.max_by do |book, checkouts|
            checkouts
        end[0]
    end
end