class Author
  attr_reader :name, :books

  def initialize(data)
    @name = data[:first_name] + " " + data[:last_name]
    @books = []
  end

  def add_book(book_obj)
    @books << book_obj
  end
end
