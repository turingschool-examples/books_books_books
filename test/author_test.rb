require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/book'
require_relative '../lib/author'

class AuthorTest < Minitest::Test

  def test_it_exists_and_has_attributes
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal "Charlotte Bronte", charlotte_bronte.name
    assert_equal [], charlotte_bronte.books
  end

end
