class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    @books << author.books
    @books.flatten
  end

  def publication_time_frame_for(author)
    times = []
    time_frame = {}
    author.books.map do |book|
      times << book[:publication_date]
    end
    time_frame[:start] = times.min
    time_frame[:end] = times.max
    time_frame
  end
end
