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
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    {
      start: author.earliest_year_published,
      end: author.latest_year_published
    }
  end

  def checkoutable?(book)
    @books.include?(book) && !@checked_out_books.include?(book)
  end

  def checkout(book)
    if checkoutable?(book)
      @checked_out_books.push(book)
    else
      false
    end
  end
end
