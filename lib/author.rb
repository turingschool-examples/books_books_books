require './lib/book'

class Author
  attr_reader :books, :first_name, :last_name

  def initialize(author_deets)
    @books = []
    @first_name = author_deets[:first_name]
    @last_name = author_deets[:last_name]

  end

  def name
    @first_name + " " + @last_name
  end

  def write(title, publication_date)
    book_deets = {}
    book_deets[:title] = title
    book_deets[:publication_date] = publication_date
    book_deets[:author_first_name] = @first_name
    book_deets[:author_last_name] = @last_name
    book = Book.new(book_deets)
    books << book
    book
  end
end