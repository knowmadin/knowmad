 Resque.redis = Redis.new(host: 'redis', port: 6379)
 Resque.after_fork = proc { ActiveRecord::Base.establish_connection }
