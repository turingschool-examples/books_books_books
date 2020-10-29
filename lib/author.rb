require './lib/book.rb'

class Author
  attr_reader :name, :books
  def initialize(input_hash)
    @first_name = input_hash[:first_name]
    @last_name = input_hash[:last_name]

    @name = @first_name + " " + @last_name
    @books = []
  end

  def write(title,publication_date)
    book = create_book(title,publication_date)
    @books << book
    book
  end

  def create_book(title,publication_date)
    Book.new({
        author_first_name: @first_name,
        author_last_name: @last_name,
        title: title,
        publication_date: publication_date
      }
    )
  end

  
end
