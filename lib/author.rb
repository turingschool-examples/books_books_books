class Author
  attr_reader :name,
              :books
  def initialize(data)
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @name = "#{@first_name} #{@last_name}"
    @books = []
  end

  def write(title, publication_date)
    new_book = Book.new({
                        author_first_name: @first_name,
                        author_last_name: @last_name,
                        title: title,
                        publication_date: publication_date
                      })
    @books.push(new_book)
    new_book
  end
end


# author_first_name: "Harper",
# author_last_name: "Lee",
# title: "To Kill a Mockingbird",
# publication_date: "July 11, 1960"})
