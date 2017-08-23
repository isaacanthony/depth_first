require 'depth_first'

# Task A
class A < DepthFirst::Task
  def perform
    sleep(1)
    options.merge(a: 1)
  end
end

# Task B
class B < DepthFirst::Task
  def perform
    options.merge(b: 2)
  end
end

# Task C
class C < DepthFirst::Task
  def perform
    options.merge(c: 3)
  end
end

# Sequential ABC
class SequentialAbc < DepthFirst::SequentialOrganizer
  TASKS = [A, B, C].freeze
end

# Parallel ABC
class ParallelAbc < DepthFirst::ParallelOrganizer
  TASKS = [A, B, C].freeze
end
