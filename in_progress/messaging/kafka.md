# kafka

* Only supports pub/sub (topics)
* Throughput up to 1 million messges/sec
* Each topic can have multiple partitions
* Messages are only order inside in the same partition
* Each message gets an incremental ID called offset. Offsets are specific to a partition
* Kafka topics are immutable
* Data in a partition cannot be changed
* Data is stored for a limited period of time (default is one week)
* Data is assigend randomly to a partition unless a key is provided