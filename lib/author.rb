class Author
  attr_reader :name, :books, :write  # => nil

  def initialize(data)
    @name = data[:first_name] + " " + data[:last_name]
    @books = []
  end                                                   # => :initialize

  def write(title, publication_date)
    Book.new({author_first_name: 'charlotte', author_last_name: "Bronte", title: title, publication_date: publication_date})
  end

  def self.write(title, publication_date)
    @books << write(title, publication_date)
  end                                                                                                                          # => :write
end                                                                                                                               # => :write
