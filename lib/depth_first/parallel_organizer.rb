module DepthFirst
  # Base parallel organizer class
  class ParallelOrganizer < SequentialOrganizer
    DEPENDENCIES = [].freeze

    def initialize(options)
      super(options)
      load_dependencies
    end

    def perform
      tasks.map { |task| execute_promise(task) }
           .reduce(options) { |a, e| resolve_promise(a, e) }
    end

    private

    # Load dependencies before concurrency to get
    # around lazy-loading race condition.
    def load_dependencies
      dependencies.each { |dependency| dependency }
    end

    def dependencies
      self.class::DEPENDENCIES
    end

    def execute_promise(task)
      Concurrent::Promise.new { task.new(options).perform }.execute
    end

    def resolve_promise(hsh, result)
      result.value ? hsh.merge(result.value) : (raise result.reason)
    end
  end
end
