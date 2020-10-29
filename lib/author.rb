class Author
  attr_reader :name,
              :books

  def initialize(data)
    @name = data[:first_name] + " " + data[:last_name]
    @books = []
  end

  def write(title, publication_date)
    author_name = self.name.split(" ")
    author_first_name = author_name[0]
    author_last_name = author_name[1]
    book = Book.new({title: title, publication_date: publication_date, author_first_name: author_first_name, author_last_name: author_last_name})
    @books << book
    book
  end
end