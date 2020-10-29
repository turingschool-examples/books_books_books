class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
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

  def publication_time_frame_for(author)
    {
      :start => first_book(author),
      :end => last_book(author)
    }
  end

  def last_book(author)
    author.books.max_by do |book|
      book.publication_year
    end.publication_year
  end

  def first_book(author)
    author.books.min_by do |book|
      book.publication_year
    end.publication_year
  end

  def checkout(book_to_checkout)
    available = @books.find do |book|
      @checked_out_books << book_to_checkout if book == book_to_checkout
    end
    available != nil
  end
end