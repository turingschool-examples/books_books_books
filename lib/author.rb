require './lib/book'

class Author
  attr_reader :first_name, :last_name, :books

  def initialize(data)
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end

  def write(title, publication_date)
    Book.new({author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: publication_date})
  end

  def add_book(book)
    @books << book
  end
end
