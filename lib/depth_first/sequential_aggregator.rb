module DepthFirst
  # Base sequential aggregator class
  class SequentialAggregator < Task
    TASKS = [].freeze
    KEY   = nil

    def perform
      key   = self.class::KEY
      value = self.class::TASKS.map { |task| task.new(options).perform }
      { key => value }
    end
  end
end
