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
    @books << Book.new({title: title,
                        author_first_name: @first_name,
                        author_last_name: @last_name,
                        publication_date: date
                        })
    @books.last
  end
end
