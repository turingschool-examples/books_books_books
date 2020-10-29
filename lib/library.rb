class Library
  attr_reader :name,
              :library_books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name = name
    @library_books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    @library_books << author.books
    @library_books.flatten
  end

  def publication_time_frame_for(author)
    time_frame = {}
    years = author.books.map do |book|
      book.year.to_i
    end
    time_frame[:start] = years.min.to_s
    time_frame[:end] = years.max.to_s
    time_frame
  end

  def checkout(book)
    if @library_books.include?(book)
      @libaray_books.delete(book)
      @checked_out_books << book
      most_popular_book_count[book.title] += 1
    else
      false
    end
  end

  def return(book)
    if @checked_out_books.include?(book)
       @checked_out_books.delete(book)
       @library_books << book
    end
  end

  def most_popular_book_count
    @libaray_books.each_with_object({}) do |book, breakdown|
      breakdown[book.title] = 0
    end
  end

  def most_popular_book
    @most_popular_book_count.max_by do |book, count|
      count
    end
  end


end
