class Author
  attr_reader :first_name,
              :last_name,
              :name,
              :books

  def initialize(params = {})
    @first_name = params.fetch(:first_name)
    @last_name  = params.fetch(:last_name)
    @name       = full_name(:first_name, :last_name)
    @books      = []
  end

  def full_name(author_first_name, author_last_name)
    @first_name + " " + @last_name
  end

  def write(title, publication_date)
    @books << Book.new({author_first_name: self.first_name, author_last_name: self.last_name, title: name, publication_date: publication_date})
  end


end
