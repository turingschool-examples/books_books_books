class Author
  attr_reader :first_name,
              :last_name,
              :name,
              :books

    def initialize(first_name: first_name, last_name: last_name)
      @first_name = first_name
      @last_name = last_name
      @name = @first_name + " " + @last_name
      @books = []
    end

    def write(book_name, publication_date)
      book_name = Book.new({author_first_name: @first_name, author_last_name: @last_name, title: book_name, publication_date: publication_date})
      @books << book_name
      book_name
    end
end
