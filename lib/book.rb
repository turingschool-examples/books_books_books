class Book
  attr_reader :publication_date, 
              :title,
              :author,
              :publication_year

  def initialize(data)
    @title = data[:title]
    @publication_date = data[:publication_date]
    @author = data[:author_first_name] + " " + data[:author_last_name]
    @publication_year = @publication_date[-4..-1]
  end
end