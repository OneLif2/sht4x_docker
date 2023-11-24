import redis

redis = redis.Redis(
host = '192.168.1.199' ,
port = '30002' 
)


redis.set('key', 'Connected')
value = redis.get('key')
print(value)
#END
