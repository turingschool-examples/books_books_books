require "minitest/autorun"
require "minitest/pride"
require "./lib/author.rb"

class AuthorTest < Minitest::Test
  def setup
    @author = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Author, @author

    assert_equal "Charlotte Bronte", @author.name
    assert_equal [], @author.books
  end
end
