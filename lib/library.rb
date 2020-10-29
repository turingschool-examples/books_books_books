class Library
    attr_reader :name,
                :books,
                :authors

    def initialize(name, books = [] , authors = [])
        @name = name
        @books = books
        @authors = authors
    end
    
    def add_author(author)
        @authors << author
        @authors.map do |author|
            author.books.each do |book|
                @books << book
            end
        end
        @authors
    end

    def publication_time_frame_for(author)
        time_frame = {}
        
        author.books.each_with_index do |book , index|
        
            if index == 0 
                if book.publication_date.length > 4
                    time_frame[:start] = book.publication_year 
                else
                    time_frame[:start] = book.publication_date
                end
                
            else index == author.books.count
                if book.publication_date.length > 4
                    time_frame[:end] = book.publication_year 
                else
                    time_frame[:end] = book.publication_date
                end
                
            end
           
            
        end
    
        time_frame
    end
end