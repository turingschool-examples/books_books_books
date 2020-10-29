require './lib/book'

class Author
  attr_reader :first_name, :last_name, :books, :name
  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @name = "#{info[:first_name]} #{info[:last_name]}"
    @books = []
  end

  def write(book, date)
    book = Book.new({author_first_name: self.first_name, author_last_name: self.last_name, title: book, publication_date: date})
    books << book
    book
  end





end
