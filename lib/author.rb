require './lib/book'

class Author
  attr_reader :name, :books

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @name = "#{info[:first_name]} #{info[:last_name]}"
    @books = []
  end

  def write(title, date)
    books << Book.new({title: title,
                        author_first_name: @first_name,
                        author_last_name: @last_name,
                        publication_date: date
                        })
    books.last
  end

  def first_book_published
    first = books.min_by do |book|
      book.publication_year
    end
    first.publication_year
  end

  def last_book_published
    last = books.max_by do |book|
      book.publication_year
    end
    last.publication_year
  end
end
