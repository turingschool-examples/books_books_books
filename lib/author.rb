require './lib/book'

class Author
  attr_reader :books, :first_name, :last_name

  def initialize(author_deets)
    @books = []
    @first_name = author_deets[:first_name]
    @last_name = author_deets[:last_name]

  end
end