require_relative 'test_helper'

# Tests for DepthFirst::ParallelOrganizer
class TestParallelOrganizer < Minitest::Test
  def test_perform
    result = ParallelAbc.new(test: true).perform
    assert_equal(result, test: true, a: 1, b: 2, c: 3)
  end

  def test_exception
    err = assert_raises(RuntimeError) do
      ParallelException.new(test: true).perform
    end

    assert_equal(err.message, 'Oops!')
  end
end
