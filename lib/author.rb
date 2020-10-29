class Author
  attr_reader :name, :books
  def initialize(hash)
    @name = hash[:first_name] + " " + hash[:last_name]
    @books = []
  end

  def write(title, publication_date)
    title = Book.new({author_first_name: @name.split.first, author_last_name: @name.split.last, title: title, publication_date: publication_date})
    @books << title
    title
  end
end