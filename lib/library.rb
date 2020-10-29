class Library
    attr_reader :name,
                :books,
                :authors
    def initialize(name, books = [] , authors = [])
        @name = name
        @books = books
        @authors = authors
    end
    
    def add_author(author)
        @authors << author
        @authors.map do |author|
            author.books.each do |book|
                @books << book
            end
        end
        @authors
    end

    


end