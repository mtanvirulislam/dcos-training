Based on https://dobriak.github.io/post/secure-kafka-install/

$ dcos kafka broker list
[
  "0",
  "1",
  "2"

$ dcos kafka --name=kafka topic create testtopic
{
  "message": "Output: Created topic \"testtopic\".\n"

}

$ dcos kafka topic list
[
  "testtopic"

]

$ dcos kafka topic producer_test_tls testtopic 100
{
  "message": "Output: 100 records sent, 108.108108 records/sec (0.11 MB/sec),
142.03 ms avg latency, 831.00 ms max latency, 132 ms 50th, 184 ms 95th, 831 ms
99th, 831 ms 99.
9th.\n"
}


