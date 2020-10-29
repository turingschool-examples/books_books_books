require './lib/book'
require './lib/author'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte",
                                  last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_has_attributes
    assert_equal "Charlotte", @charlotte_bronte.first_name
    assert_equal "Bronte", @charlotte_bronte.last_name
    assert_equal [], @charlotte_bronte.books
  end 
end
