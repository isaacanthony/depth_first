# depth_first
Depth-first search code organization gem allowing for sequential and concurrent code execution using [concurrent-ruby](https://github.com/ruby-concurrency/concurrent-ruby).

## Example
### Tasks
A task accepts an input hash and merges in a results hash.
```
class A < DepthFirst::Task
  def perform
    { a: 1 }
  end
end

class B < DepthFirst::Task
  def perform
    { b: 2 }
  end
end

class C < DepthFirst::Task
  def perform
    { c: 3 }
  end
end
```

### Organizers
An organizer chains together tasks, piping a hash through each subtask.
```
class SequentialAbc < DepthFirst::SequentialOrganizer
  TASKS = [A, B, C].freeze
end

class ParallelAbc < DepthFirst::ParallelOrganizer
  TASKS = [A, B, C].freeze
end
```

## Usage
### SequentialOrganizer
Data is passed through `A`, `B`, and `C` sequentially. The input hash `{ testing: true }` is piped through A. The resulting hash `{ testing: true, a: 1 }` is then piped through B. And so on.
```
> SequentialAbc.new(testing: true).perform
=> { testing: true, a: 1, b: 2, c: 3 }
```

### ParallelOrganizer
Data is passed through `A`, `B`, and `C` concurrently. All three classes execute in parallel. The input hash `{ testing: true }` is passed to all three classes and all three intermediate result hashes are merged into the final result hash once their promises are resolved.
```
> ParallelAbc.new(testing: true).perform
=> { testing: true, a: 1, b: 2, c: 3}
```

## Note
An organizer can have a subtask which is itself another organizer. In this manner, code can be organized in an arbitrarily deep tree structure with order of execution roughly matching a Depth First Search algorithm.
