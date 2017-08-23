require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/test_task.rb',
                          'test/test_serial_organizer.rb',
                          'test/test_parallel_organizer.rb']
  t.verbose = true
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

task default: %i[test rubocop]
