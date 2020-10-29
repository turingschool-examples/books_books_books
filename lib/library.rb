class Library
  attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []    
  end

  def add_author(author)
    author.books.each { |book| @books << book }
    @authors << author
  end

  def publication_time_frame_for(author)
    time_frame = {}
    time_frame[:start] = author.books.map {|book| book.publication_year}.min
    time_frame[:end] = author.books.map {|book| book.publication_year}.max
    time_frame
  end
end