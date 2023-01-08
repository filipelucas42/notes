# Redis

* trivago article about redis usage in production: https://tech.trivago.com/post/learn-redis-the-hard-way/

Clusters should always have an odd numbers of shards and two replicas per primary shard

## Commands

* check memory stats: `info memory`
* general info (cpu, mode, key number>): `info`
* list keys: `keys *` (NEVER use this command in production!)
* set key: `set key_name key_value`
* get key contents: `get key_name`