require './lib/author'

class Book < Author
  attr_reader :title,
              :author_first_name,
              :author_last_name,
              :author,
              :publication_date,
              :publication_year

  def initialize(params = {})
    @author_first_name = params.fetch(:author_first_name)
    @author_last_name  = params.fetch(:author_last_name)
    @title             = params.fetch(:title)
    @author            = full_name(:author_first_name, :author_last_name)
    @publication_date  = params.fetch(:publication_date)
    @publication_year  = @publication_date.split[-1]
  end

  def full_name(author_first_name, author_last_name)
    @author_first_name + " " + @author_last_name
  end

end
