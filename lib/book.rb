class Book
  attr_reader :title, :author, :publication_year

  def initialize(book_hash)
    @title  = data[:title]
    @author = data[:author_first_name] + " " + data[:author_last_name]
    @publication_year = data[:publication_date].slice(-4, 4)
  end
end
