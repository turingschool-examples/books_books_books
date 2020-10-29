class Book
  attr_reader :title,
              :author,
              :publication_year

  def initialize(book_deets)
    @title = book_deets[:title]
    @author = book_deets[:author_first_name] + " " + book_deets[:author_last_name]
    @publication_year = book_deets[:publication_date][-4..-1]
  end
end