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
    books << author.books
    books.flatten!
  end

  def publication_time_frame_for(author)
    books = @books.select do |book|
      book.author == author.name
    end
    book_dates = books.map do |book|
      book.publication_year
    end
    time_frame = {}
    time_frame[:start] = book_dates.min
    time_frame[:end] = book_dates.max
    time_frame
  end

  def checkout(book)
    if @checked_out_books.include?(book) || !@books.include?(book)
      false
    else
      @checked_out_books << book
    end
  end
end
