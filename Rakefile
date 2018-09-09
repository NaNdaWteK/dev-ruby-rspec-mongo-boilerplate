require 'rspec/core/rake_task'
require 'yaml'

env = YAML.load(File.read("./environment.yml"))

task :default => :start

task :start do
  sh "rerun --background -- rackup --port #{env['port']} -o 0.0.0.0"
end

task :tdd do
  sh 'rspec spec/tdd'
end

task :feature do
  sh 'rspec spec/feature'
end

task :integration do
  sh 'rspec spec/integration'
end

task :test => [:feature, :tdd, :integration] do
end

task :tag, [:tag] do |t, arg|
  sh "rspec --tag #{arg.tag}"
end

desc 'Run labeled tests'
RSpec::Core::RakeTask.new do |test, args|
  test.pattern = Dir['spec/**/*_spec.rb']
  test.rspec_opts = args.extras.map { |tag| "--tag #{tag}" }
end
