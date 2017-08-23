require_relative 'test_helper'

# Tests for DepthFirst::ParallelOrganizer
class TestParallelOrganizer < Minitest::Test
  def setup
    @result = ParallelAbc.new(test: true).perform
  end

  def test_perform
    assert_equal(@result, test: true, a: 1, b: 2, c: 3)
  end
end
