class Book
  attr_reader :title,
              :author

  def initialize(data)
    @title = data[:title]
    @author = data[:author]
  end
end
