require_relative 'test_helper'

# Tests for DepthFirst::Task
class TestTask < Minitest::Test
  def setup
    @result = B.new(test: true).perform
  end

  def test_perform
    assert_equal(@result, test: true, b: 2)
  end
end
