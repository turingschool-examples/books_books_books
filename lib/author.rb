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

  def earliest_year_published
    @books.min_by do |book|
      book.publication_year.to_i
    end.publication_year
  end

  def latest_year_published
    @books.max_by do |book|
      book.publication_year.to_i
    end.publication_year
  end
end
