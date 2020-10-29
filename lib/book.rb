class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title,
              :publication_date

  def initialize(
    author_first_name:,
    author_last_name:,
    title:,
    publication_date:
  )

    @author_first_name = author_first_name
    @author_last_name = author_last_name
    @title = title
    @publication_date = publication_date
  end

  def author
    @author = author_first_name + " " + author_last_name
  end

  def publication_year
      year = publication_date.split(" ")
      year[2]
  end
end
