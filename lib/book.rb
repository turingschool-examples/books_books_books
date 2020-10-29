class Book

  attr_reader   :author_first_name,
                :author_last_name,
                :title,
                :publication_date,
                :author,
                :publication_year,
                :books

  def initialize(author_first_name: author_first_name, author_last_name: author_last_name, title: title, publication_date: publication_date)
    @author_first_name = author_first_name
    @author_last_name = author_last_name
    @title = title
    @publication_date = publication_date
    @author = @author_first_name + " " + @author_last_name
    @publication_year = @publication_date.split[-1]
    @books = []
  end

  def write(book_name, publication_date)
    @books
  end
end
