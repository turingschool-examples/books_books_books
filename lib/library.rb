class Library
  attr_reader :authors, :books, :name

  def initialize(name)
    @name = name
    @authors = []
    @books = []
  end

  def add_author(author)
    @authors << author
    author.books.map {|book| @books << book}
  end
end
