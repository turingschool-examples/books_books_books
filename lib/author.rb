class Author
  attr_reader :first_name,
              :last_name,
              :books

  def initialize(
    first_name:,
    last_name:
  )

    @first_name = first_name
    @last_name = last_name
    @books = []
  end

  def name
    @name = first_name + " " + last_name
  end

  def write(title, publication_date)
  end

  def class
    
  end
end
