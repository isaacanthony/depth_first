require_relative 'test_helper'

# Tests for DepthFirst::SequentialAggregator
class TestSequentialAggregator < Minitest::Test
  def setup
    @result = SequentialAggregatorAbc.new(test: true).perform
  end

  def test_perform
    assert_equal(@result, results: [{ a: 1 }, { b: 2 }, { c: 3 }])
  end
end
