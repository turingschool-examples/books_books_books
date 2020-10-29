class Book
    attr_reader :title, :author, :publication_year

    def initialize(description)
        @title = description[:title]
        @author = description[:author_first_name] + " " + description[:author_last_name]
        @publication_year = date_reformat(description[:publication_date])
    end

    def date_reformat(date)
        return date if date.length == 4
        return date[-4..-1]
    end
end