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
end



#The `publication_time_frame_for` method takes an `Author` 
# object as an argument and returns a hash with two 
# key/value pairs:
# * `:start` which points to the publication year of the 
# `Author`'s first book.
# * `:end` which points to the publication year of the 
# `Author`'s last book.
