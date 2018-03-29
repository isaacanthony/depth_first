require_relative 'test_helper'

# Tests for DepthFirst::Task
class TestTask < Minitest::Test
  def test_perform
    result = B.new(test: true).perform
    assert_equal(result, b: 2)
  end

  def test_exception
    err = assert_raises(RuntimeError) do
      ExceptionTask.new(test: true).perform
    end

    assert_equal(err.message, 'Oops!')
  end
end
