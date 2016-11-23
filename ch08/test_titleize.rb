# A method extending String to demo minitest
class String
  def titleize
    gsub(/(\A|\s)\w/, &:upcase)
  end
end

require 'minitest/autorun'

# A short test method to demonstrate minitest
class TestTitleize < Minitest::Test
  def test_basic
    assert_equal('This Is A Test', 'this is a test'.titleize)
    assert_equal('Another Test 1234', 'another test 1234'.titleize)
    assert_equal("We're Testing", "we're testing".titleize)
  end
end
