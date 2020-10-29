class Book
  attr_reader :title
  def initialize(book_data)
    @author_first_name = book_data[:author_first_name]
    @author_last_name  = book_data[:author_last_name]
    @title             = book_data[:title]
    @publication_date  = book_data[:publication_date]
  end

  def publication_year
    @publication_date.chars.last(4).join
  end

  def author
    @author_first_name + " " + @author_last_name
  end
end
