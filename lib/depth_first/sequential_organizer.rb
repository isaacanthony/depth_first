module DepthFirst
  # Base sequential organizer class
  class SequentialOrganizer < Task
    TASKS = [].freeze

    def perform
      tasks.reduce(options) do |hsh, task|
        hsh.merge(task.new(hsh).perform)
      end
    end

    private

    def tasks
      self.class::TASKS
    end
  end
end
