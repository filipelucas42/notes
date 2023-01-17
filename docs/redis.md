# Redis

* trivago article about redis usage in production: https://tech.trivago.com/post/learn-redis-the-hard-way/

Clusters should always have an odd numbers of shards and two replicas per primary shard

## Commands

* check memory stats: `info memory`
* check replication (see if node is master or slave): `info replication`
* create slave: `SLAVEOF <ip> <port>`
* promote slave to master: `SLAVEOF NO ONE`
* general info (cpu, mode, key number>): `info`
* list keys: `keys *` (NEVER use this command in production!)
* set key: `set key_name key_value`
* get key contents: `get key_name`

## Common config 
```
protected-mode no
#bind 127.0.0.1 -::1 (comment this line)
```

## Cluster

Configs for cluster:
```
protected-mode no
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 15000
appendonly yes
```

* create cluster: `redis-cli --cluster create node_1_ip:node_1_port node_2_ip:node_2_port ... --cluster-replicas 1`

## Master - Slave

### Slave config
```
replicaof ip port
```