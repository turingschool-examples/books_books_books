class Author
  attr_reader :name, :books
  def initialize(input_hash)
    @name = input_hash[:first_name] + " " + input_hash[:last_name]
    @books = []
  end
end
