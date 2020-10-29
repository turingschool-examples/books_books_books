require './lib/book'
require './lib/author'

class Library

    attr_reader :name, :books, :authors

    def initialize(name, books = [], authors = [])
        @name = name
        @books = books
        @authors = authors
    end

    def add_author(author)
        @authors << author
        author.books.each do |book|
            @books << book
        end
    end

    def publication_time_frame_for(author)
        frame = {}
        pub_dates = author.books.map do |book|
            book.publication_year
        end
        frame[:start] = pub_dates.min
        frame[:end] = pub_dates.max
        frame
    end

    def checkout_out_books
        library.books.find_all do |book|
            book.checked_out = true
        end
    end

    def checkout(book)
        if self.books.include? book
            if book.checked_out == false
            book.checked_out = true
            else false
            end
        else return false
        end
    end

    def return(book)
    end

    def most_popular_book
    end
end