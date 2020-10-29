require './lib/book'

class Author
  attr_reader :name, :books

  def initialize(author_data)
    @name = author_data[:first_name] + " " + author_data[:last_name]
    @books = []
  end
end
