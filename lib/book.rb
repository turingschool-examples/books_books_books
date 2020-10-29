class Book

    attr_reader :author_fist_name,
                :author_last_name,
                :title,
                :publication_date

    attr_accessor :checked_out, :rating

    def initialize(data)
        @author_first_name = data[:author_first_name]
        @author_last_name = data[:author_last_name]
        @title = data[:title]
        @publication_date = data[:publication_date]
        @checked_out = data[:checked_out] = false
        @rating = data[:rating] = 0
    end

    def author
        @author_first_name + " " + @author_last_name
    end

    def publication_year
        @publication_date.chars.last(4).join
    end

end


