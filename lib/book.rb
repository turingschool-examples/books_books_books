class Book
  attr_reader :title, :author, :publication_year
  def initialize(input_hash) #first_name,last_name,title,publication_date
    @author = input_hash[:author_first_name] + " " + input_hash[:author_last_name]
    @title = input_hash[:title]
    @publication_year = input_hash[:publication_date][-4..-1]
  end
end
