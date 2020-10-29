class Book
  attr_reader :title, :author

  def initialize(data)
    @title = data[:title]
    @author = data[:author_first_name] + " " + data[:author_last_name]
    @publication_date = data[:publication_date]
    @rented = nil
    @issue_count = 0
  end

  def publication_year
    @publication_date[-4..-1]
  end

end
