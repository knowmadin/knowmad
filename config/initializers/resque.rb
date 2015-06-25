 Resque.redis = Redis.new(host: 'redis', port: 6379)
 Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
