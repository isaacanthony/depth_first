module DepthFirst
  # Base parallel organizer class
  class ParallelOrganizer < SequentialOrganizer
    def perform
      tasks.map { |task| execute_promise(task) }
           .reduce(options) { |a, e| resolve_promise(a, e) }
    end

    private

    def execute_promise(task)
      Concurrent::Promise.new { task.new(options).perform }.execute
    end

    def resolve_promise(hsh, result)
      hsh.merge(result.value)
    end
  end
end
