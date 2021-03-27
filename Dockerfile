FROM centos:7
RUN yum install -y java wget gettext
RUN wget https://apache.mirrors.nublue.co.uk/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz && wget https://archive.apache.org/dist/kafka/2.5.1/kafka_2.13-2.5.1.tgz
RUN tar -xzf apache-zookeeper-3.6.2-bin.tar.gz && mv /apache-zookeeper-3.6.2-bin /zookeeper
RUN tar -xzf kafka_2.13-2.5.1.tgz && mv /kafka_2.13-2.5.1 /kafka
RUN mkdir /zookeeper/data /kafka/data
COPY files/default_zoo.conf /zookeeper/conf/zoo.cfg
COPY files/zookeeper_id.conf /zookeeper/zookeeper_id.conf
COPY files/default_kafka.conf /kafka/default_kafka.conf
COPY files/kafkaClusterStart.sh /usr/local/bin/kafkaClusterStart.sh
RUN chmod 700 /usr/local/bin/kafkaClusterStart.sh
CMD ["/usr/local/bin/kafkaClusterStart.sh"]
