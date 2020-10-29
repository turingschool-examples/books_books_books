class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title,
              :publication_date,
              :author,
              :publication_year

  def initialize(data)
    @author_first_name = data[:author_first_name]
    @author_last_name = data[:author_last_name]
    @title = data[:title]
    @publication_date = data[:publication_date]
    @publication_year = publication_date[-4..-1]
    @author = @author_first_name + " " + @author_last_name
  end

end
