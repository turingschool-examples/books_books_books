require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test

  def test_it_exists
    charlotte_bronte = Author.new({first_name: "Charlotte", 
                                   last_name: "Bronte"})
    asser_instance_of Author, charlotte_bronte
  end
end
