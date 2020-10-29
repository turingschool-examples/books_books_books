require 'minitest/autorun'
require 'minitest/pride'
require './lib/author'
require './lib/book'
class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Author, @charlotte_bronte
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
    assert_equal [], @charlotte_bronte.books
  end
end
