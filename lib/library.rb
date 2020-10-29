class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books,
              :times_checked_out
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @times_checked_out = {}
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
      times_checked_out(book)
    end
  end

  def times_checked_out(book)
    if @times_checked_out[book]
      @times_checked_out[book] += 1
    else
      @times_checked_out[book] = 1
    end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    require 'pry'; binding.pry
    @times_checked_out.max_by do |book, amount_checked_out|
      amount_checked_out
    end[0]
  end
end
