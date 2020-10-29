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
    require 'pry';binding.pry
    @books << Book.new(params = {})
  end


end
