class Author
    attr_reader :name, :books

    def initialize(description)
        @name = description[:first_name] + " " + description[:last_name]
        @books = []
    end

end