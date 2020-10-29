class Library
  attr_reader :name,
              :books,
              :checked_out_books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @checked_out_books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      books << book
    end
  end

  def publication_time_frame_for(author)
    max = 0
    min = 10_000
    author.books.each do |book|
      pub_year = book.publication_year.to_i
      max = pub_year if pub_year > max
      min = pub_year if pub_year < min
    end

    {:start => min.to_s, :end => max.to_s}
  end

  def checkout(book)
    if books.include?(book)
      @books.delete(book)
      @checked_out_books << book
    else
      false
    end
  end
end