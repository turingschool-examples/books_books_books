class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    add_author_books(author)
  end

  def add_author_books(author)
    author.books.each do |book|
      @books << book
    end
  end
end