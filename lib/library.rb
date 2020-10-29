class Library
  attr_reader :authors, :books, :name, :checked_out_books

  def initialize(name)
    @name = name
    @authors = []
    @books = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    author.books.map {|book| @books << book}
  end

  def publication_time_frame_for(author)
    time_frame = Hash.new
    time_frame[:start] = first_book(author).publication_year
    time_frame[:end] = last_book(author).publication_year
    time_frame
  end

  def first_book(author)
    author.books.min_by do |book|
      book.publication_year
    end
  end

  def last_book(author)
    author.books.max_by do |book|
      book.publication_year
    end
  end

  def checkout(book)
    if available?(book)
      @checked_out_books << book
      true
    else
      false
    end
  end

  def available?(book)
    @books.include?(book) && !@checked_out_books.include?(book)
  end

  def return(book)
    @checked_out_books.delete(book)
  end

end
