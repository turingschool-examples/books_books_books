class Author
  attr_reader :name, :books

  def initialize(data)
    @name = data[:first_name] + " " + data[:last_name]
    @books = []
  end

  def add_book(book_obj)
    @books << book_obj
  end

  def write(title_str, year_str)
    book_details = {
      :title => title_str,
      :publication_date => year_str,
      :author_first_name =>  self.name.split(" ")[0],
      :author_last_name => self.name.split(" ")[1]
    }
    Book.new(book_details)
  end


end
