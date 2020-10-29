class Book
  attr_reader :publication_date, 
              :author_first_name,
              :author_last_name,
              :title,
              :author,
              :publication_year
              
  def initialize(data)
    @author_first_name = data[:author_first_name]
    @author_last_name = data[:author_last_name]
    @title = data[:title]
    @publication_date = data[:publication_date]
    @author = @author_first_name + @author_last_name
    @publication_year = @publication_date[-4..-1]
  end
end