class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    time_frame = Hash.new
    min = author.books.min_by do |book|
      book.publication_year
    end
    max = author.books.max_by do |book|
      book.publication_year
    end
    time_frame[:start] = min.publication_year
    time_frame[:end] = max.publication_year
    time_frame
  end

  def checkout(book)
  end


end
