require 'depth_first'

# Task A
class A < DepthFirst::Task
  def perform
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

# Task that results in raised exception
class ExceptionTask < DepthFirst::Task
  def perform
    raise 'Oops!'
  end
end

# Sequential organizer ABC
class SequentialAbc < DepthFirst::SequentialOrganizer
  TASKS = [A, B, C].freeze
end

# Parallel organizer ABC
class ParallelAbc < DepthFirst::ParallelOrganizer
  TASKS = [A, B, C].freeze
end

# Sequential organizer with exception
class SequentialException < DepthFirst::SequentialOrganizer
  TASKS = [ExceptionTask, A].freeze
end

# Parallel organizer with exception
class ParallelException < DepthFirst::ParallelOrganizer
  TASKS = [ExceptionTask, A].freeze
end
