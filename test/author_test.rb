require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists_with_attributes
    assert_instance_of Author, @charlotte_bronte
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
    assert_equal [], @charlotte_bronte.books
  end

  def test_she_writes
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_equal "Jane Eyre", @jane_eyre.title 
    assert_equal "October 16, 1847", @jane_eyre.publication_year 
  end
end