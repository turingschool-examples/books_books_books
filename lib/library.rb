class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books,
              :popularity
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @popularity = Hash.new { |popularity, book| popularity[book] = 0 }
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
      @popularity[book] += 1
      @checked_out_books.push(book)
      true
    else
      false
    end
  end

  def most_popular_book
    @popularity.max_by do |book, count_checked_out|
      count_checked_out
    end.first
  end

  def return(book)
    @checked_out_books.delete(book)
  end
end
