class Book
    attr_reader :author_first_name,
                :author_last_name,
                :title,
                :publication_date

    def initialize(data)
        @author_first_name = data[:author_first_name]
        @author_last_name  = data[:author_last_name]
        @title             = data[:title]
        @publication_date  = data[:publication_date]
    end

    def publication_year
        # require 'pry'; binding.pry
        @publication_date.slice(-4..-1)
    end
end