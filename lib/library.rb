class Library
  attr_reader :authors, :books, :name, :checked_out_books

  def initialize(name)
    @name = name
    @authors = []
    @books = []
    @checked_out_books = []
    @books_by_popularity = Hash.new(0)
  end

  def add_author(author)
    @authors << author
    author.books.map {|book| @books << book}
  end

  def publication_time_frame_for(author)
    {start: author.first_book_published, end: author.last_book_published}
  end

  def checkout(book)
    if available?(book)
      @checked_out_books << book
      @books_by_popularity[book] += 1
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

  def most_popular_book
    most_popular = @books_by_popularity.max_by do |book, times_checked_out|
      times_checked_out
    end
    most_popular[0]
  end
end
