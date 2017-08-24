module DepthFirst
  # Base sequential organizer class
  class SequentialOrganizer < Task
    TASKS = [].freeze

    def perform
      self.class::TASKS.reduce(options) do |hsh, task|
        hsh.merge(task.new(hsh).perform)
      end
    end
  end
end
