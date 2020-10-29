class Library
  attr_reader :name, :books, :authors, :checked_out_books
  def initialize(name)
    @name = name
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
  end

  def books
    @authors.flat_map do |author|
      author.books
    end
  end

  def publication_time_frame_for(author)
    {
      start: find_year_first_book_written(author),
      end: find_year_last_book_written(author)
    }
  end

  def find_year_first_book_written(author)
    first_book = author.books.min_by do |book|
      book.publication_year.to_i
    end
    first_book.publication_year
  end

  def find_year_last_book_written(author)
    last_book = author.books.max_by do |book|
      book.publication_year.to_i
    end
    last_book.publication_year
  end
end
