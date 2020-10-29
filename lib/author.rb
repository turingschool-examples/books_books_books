class Author
    attr_reader :name, :books

    def initialize(description)
        @name = description[:first_name] + " " + description[:last_name]
        @books = []
        @first_name = description[:first_name]
        @last_name = description[:last_name]
    end

    def write(title, date)
        description = description_for_book(title, date)
        new_book = Book.new(description)
        @books << new_book
        new_book
    end


    def description_for_book(title, date)
        description = {
            author_first_name: @first_name,
            author_last_name: @last_name,
            title: title,
            publication_date: date
        }
    end
end