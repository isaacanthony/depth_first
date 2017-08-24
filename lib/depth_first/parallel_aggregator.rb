module DepthFirst
  # Base parallel aggregator class
  class ParallelAggregator < Task
    TASKS = [].freeze
    KEY   = nil

    def perform
      key   = self.class::KEY
      value = self.class::TASKS.map { |task| execute_promise(task) }
                               .reduce([]) { |a, e| resolve_promise(a, e) }
      { key => value }
    end

    private

    def execute_promise(task)
      Concurrent::Promise.new { task.new(options).perform }.execute
    end

    def resolve_promise(arr, result)
      arr.push(result.value)
    end
  end
end
