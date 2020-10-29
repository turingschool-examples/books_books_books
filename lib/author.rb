class Author
  attr_reader:first_name,:last_name,:books
  def initialize(details)
    @first_name = details[:first_name]
    @last_name = details[:last_name]
    @books = []
  end
end
