class Library
  attr_reader :authors, :books, :name
  
  def initialize(name)
    @name = name
    @authors = []
    @books = []
  end
end
