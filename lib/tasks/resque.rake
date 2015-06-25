require 'resque/tasks'

namespace :resque do
  task :setup do
    require 'resque'
  end
end
