require_relative './book'

class Library < Book

  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_date_first_book(author)
    actual = []
    author.books.min_by do |book|
      actual << book.publication_year
      if book.publication_year < actual[0]
        actual << book.publication_year
      end
    end
    actual[0]
  end

  def publication_time_frame_for(author)
    hash = {}
    author.books.each do |book|
      hash[:start] = publication_date_first_book(author)
      hash[:end] = publication_date_first_book(author)
    end
    hash
  end
end
