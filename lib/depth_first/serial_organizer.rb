module DepthFirst
  # Base serial organizer class
  class SerialOrganizer < Task
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
