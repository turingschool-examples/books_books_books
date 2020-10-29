class Library
  attr_reader :name, :books, :authors, :checked_out_books
  def initialize(name)
    @name = name
    @books = []
    @authors = []    
    @checked_out_books = []
    @checkout_log = []
  end

  def add_author(author)
    #an add_book method is probably more proper as a library is unlikely to add all books of an author at once.
    author.books.each { |book| @books << book }
    @authors << author
  end

  def publication_time_frame_for(author)
    time_frame = {}
    time_frame[:start] = author.books.map {|book| book.publication_year}.min
    time_frame[:end] = author.books.map {|book| book.publication_year}.max
    time_frame
  end

  def checkout(book)
    if @books.include?(book)
      @checked_out_books << book
      @checkout_log << book
      @books.delete(book)
      true
    else
      false
    end
  end

  def return(book)
    if @checked_out_books.include?(book)
      @books << book
      @checked_out_books.delete(book)
    end
    #did not include an else statement for the sake of inappropriate checkouts or lost/stolen and not on record
  end

  def most_popular_book
    checkout_count = {}
    @checkout_log.each { |book| checkout_count[book] ? checkout_count[book] += 1 : checkout_count[book] = 1 }
    checkout_count.max_by { |book, count| count}[0]
  end
end