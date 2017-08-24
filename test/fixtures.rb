require 'depth_first'

# Task A
class A < DepthFirst::Task
  def perform
    sleep(1)
    { a: 1 }
  end
end

# Task B
class B < DepthFirst::Task
  def perform
    { b: 2 }
  end
end

# Task C
class C < DepthFirst::Task
  def perform
    { c: 3 }
  end
end

# Sequential organizer ABC
class SequentialOrganizerAbc < DepthFirst::SequentialOrganizer
  TASKS = [A, B, C].freeze
end

# Parallel organizer ABC
class ParallelOrganizerAbc < DepthFirst::ParallelOrganizer
  TASKS = [A, B, C].freeze
end

# Sequential aggregator ABC
class SequentialAggregatorAbc < DepthFirst::SequentialAggregator
  TASKS = [A, B, C].freeze
  KEY   = :results
end

# Parallel aggregator ABC
class ParallelAggregatorAbc < DepthFirst::ParallelAggregator
  TASKS = [A, B, C].freeze
  KEY   = :results
end
