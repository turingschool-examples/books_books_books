class Library
  attr_reader :name, :books, :authors, :checked_out_books, :popular_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @popular_books = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    time_frame = Hash.new
    min = author.books.min_by do |book|
      book.publication_year
    end
    max = author.books.max_by do |book|
      book.publication_year
    end
    time_frame[:start] = min.publication_year
    time_frame[:end] = max.publication_year
    time_frame
  end

  def checkout(novel)
    if @books.include?(novel)
      @checked_out_books << novel
      @popular_books << novel
      @books.delete(novel)
    else
      false
    end
  end

  def return(novel)
    if @checked_out_books.include?(novel)
      @books << novel
      @checked_out_books.delete(novel)
    else
      false
    end
  end

  def most_popular_book
    hash = Hash.new(0)
    @popular_books.each do |book|
      if hash[book.title]
        hash[book] += 1
      else
        hash[book] = 1
      end
    end
    max = hash.max_by do |book, count|
      count
    end
    max[0]
  end






end
