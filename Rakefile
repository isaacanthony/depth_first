require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = Dir.glob('test/*')
  t.verbose = true
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop)

task default: %i(test rubocop)
