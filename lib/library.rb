class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author_obj)
    @authors << author_obj
  end

  def add_book(book_obj)
    @books << book_obj
  end
end
