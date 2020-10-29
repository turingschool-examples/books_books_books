class Library
  attr_reader :name, :books, :authors, :checked_out_books

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
    if @books.include?(book_obj) || @checked_out_books.include?(book_obj)
      false
    else
      # require "pry"; binding.pry
      book_obj.issue_count += 1
      @checked_out_books << book_obj
      true
    end
  end

  def return(book_obj)
    @checked_out_books.delete(book_obj)
  end

  def most_popular_book
    @checked_out_books.max_by do |book|
      book.issue_count
    end
  end

end
