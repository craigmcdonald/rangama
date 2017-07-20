REDIS_CONFIG = YAML.load( File.open( Rails.root.join('config/redis.yml') ) ).symbolize_keys
default = REDIS_CONFIG[:default].symbolize_keys
config = default.merge(REDIS_CONFIG[Rails.env.to_sym].symbolize_keys) if REDIS_CONFIG[Rails.env.to_sym]

$redis = Redis.new(config)
$redis_ns = Redis::Namespace.new(config[:namespace], :redis => $redis) if config[:namespace]
Redis::Objects.redis = $redis_ns
