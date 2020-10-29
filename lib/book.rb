class Book
    attr_reader :title, :author, :publication_year

    def initialize(description)
        @title = description[:title]
        @author = description[:author_first_name] + " " + description[:author_last_name]
        @publication_year = description[:publication_date][-4..-1]
    end
end