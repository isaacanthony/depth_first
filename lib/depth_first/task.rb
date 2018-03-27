module DepthFirst
  # Base task class
  class Task
    attr_reader :options

    def initialize(options = {})
      @options = Concurrent::Hash.new.merge(options.to_h)
    end

    def perform
      options
    end
  end
end
