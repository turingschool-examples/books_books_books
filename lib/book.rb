class Book

    attr_reader :author_fist_name,
                :author_last_name,
                :title,
                :publication_date

    def initialize(data)
        @author_first_name = data[:author_first_name]
        @author_last_name = data[:author_last_name]
        @title = data[:title]
        @publication_date = data[:publication_date]
    end

    def author
        @author_first_name + " " + @author_last_name
    end

    def publication_year
        @publication_date.chars.last(4).join
    end

end


