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

  def find_author(search_author)
    @authors.find do |author|
      author == search_author
    end
  end

  def last_book(search_author)
    find_author(search_author).books.max_by do |book|
      book.publication_year.to_i
    end
  end

  def first_book(search_author)
    find_author(search_author).books.min_by do |book|
      book.publication_year.to_i
    end
  end

  def publication_time_frame_for(search_author)
    time_frame_hash = {}
    time_frame_hash[:start] = first_book(search_author).publication_year
    time_frame_hash[:end] = last_book(search_author).publication_year
    time_frame_hash
  end
end
