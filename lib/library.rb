require './lib/author'

class Library
  attr_reader :name, :authors

  def initialize(name)
    @name = name
    @authors = []
  end

  def add_author(author)
    @authors << author
  end

  def books
    if @authors != []
      @authors.map do |author|
        author.books
      end.flatten
    else
      []
    end
  end
end
