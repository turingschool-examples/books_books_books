class Author
attr_reader :first_name,
            :last_name,
            :name,
            :books

  def initialize(data)
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @name = @first_name + " " + @last_name
    @books = []
  end

  def write(title, pub_date)
    book = Book.new({
      author_first_name: @first_name,
      author_last_name: @last_name,
      title: title,
      publication_date: pub_date
      })
  end
end
