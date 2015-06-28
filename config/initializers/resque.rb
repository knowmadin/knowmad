require 'resque/failure/multiple'
require 'resque/failure/redis'
require 'resque/rollbar'

 Resque.redis = Redis.new(host: 'redis', port: 6379)
 Resque.after_fork = proc { ActiveRecord::Base.establish_connection }
 Resque::Failure::Multiple.classes = [ Resque::Failure::Redis, Resque::Failure::Rollbar ]
 Resque::Failure.backend = Resque::Failure::Multiple
