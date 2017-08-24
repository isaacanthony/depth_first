require_relative 'test_helper'

# Tests for DepthFirst::ParallelAggregator
class TestParallelAggregator < Minitest::Test
  def setup
    @result = ParallelAggregatorAbc.new(test: true).perform
  end

  def test_perform
    assert_equal(@result, results: [{ a: 1 }, { b: 2 }, { c: 3 }])
  end
end
