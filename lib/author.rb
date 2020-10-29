require './lib/book'

class Author
  attr_reader :books, :name

  def initialize(author_data)
    @first_name = author_data[:first_name]
    @last_name = author_data[:last_name]
    @name = author_data[:first_name] + " " + author_data[:last_name]
    @books = []
  end

  def write(name, publication_date)
    book_hash = {}
    book_hash[:author_first_name] = @first_name
    book_hash[:author_last_name] = @last_name
    book_hash[:publication_date] = publication_date
    book_hash[:title] = name

    book = Book.new(book_hash)
    add_book(book)
    book
  end

  def add_book(book)
    @books << book
  end
end
