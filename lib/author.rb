class Author 
  attr_reader :name, :books 

  def initialize(data)
    @name = data[:first_name] + " " + data[:last_name]
    @books = []
  end

  def write(title, publication_year)
    #each time write is called  a new book object is created with the title and publication year
    #call on book.new within method to create a new instance of book
    Book.new({:title => title, :publication_year => publication_year, :author_first_name => :first_name, :author_last_name => :last_name})
  end
end