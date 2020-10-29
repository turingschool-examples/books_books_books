class Author
  attr_reader :books,
              :first_name,
              :last_name

  def initialize(data)
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end

  def write(name, publication_date)
    new_book = Book.new({author_first_name: self.first_name,
      author_last_name: self.last_name,
      title: name,
      publication_date: publication_date})
      @books << new_book
      new_book
    end
end