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
end
