class Library
    attr_reader :name, :books, :authors
    
    def initialize(name)
        @name = name
        @books = []
        @authors = []
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
    
end