class Library
    attr_reader :name,
                :books,
                :authors

    def initialize(name)
        @name    = name
        @books   = []
        @authors = []
    end

    def add_author(author)
        @authors << author
        @books << author.books
        # require 'pry'; binding.pry
        return author 
        author.books each do |book|
            @books << book.flatten
        end
    end
end