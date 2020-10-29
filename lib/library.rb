class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author_obj)
    @authors << author_obj
  end

  def add_book(book_obj)
    @books << book_obj
  end

  def publication_time_frame_for(author_obj)
    authors_books = @books.find_all do |book|
      author_obj.name == book.author
    end
    start_year = authors_books.min_by do |book|
      book.publication_year
    end

    end_year = authors_books.max_by do |book|
      book.publication_year
    end

    publishing_range = {
      :start=> start_year.publication_year,
      :end=> end_year.publication_year
    }
  end

  def checkout(book_obj)
    if @books.include?(book_obj) || book_obj.rented != true
      false
    else
      true
    end
  end

end
