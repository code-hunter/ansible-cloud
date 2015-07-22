hosts=('hadoop06', 'hadoop08', 'flumetest')

ssh hadoop06 '/opt/cloud/hadoop-2.5.2/sbin/stop-all.sh'
ssh hadoop06 '/opt/cloud/hadoop-2.5.2/sbin/hadoop-daemons.sh stop zkfc'
for host in 'hadoop06' 'hadoop08' 'flumetest';do
	ssh $host 'rm -fr /opt/cloud/data/hadoop'
	ssh $host '/opt/cloud/zookeeper-3.4.6/bin/zkServer.sh stop'
	ssh $host 'rm -fr /opt/cloud/hadoop-2.5.2'
	ssh $host 'rm -fr /opt/cloud/zookeeper-3.4.6'
	ssh $host 'rm -rf /opt/cloud/data/zookeeper/'

done
