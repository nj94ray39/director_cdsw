#!/bin/sh

# We remove any natively installed JDKs, as both Cloudera Manager and Cloudera Director only support Oracle JDKs
yum remove --assumeyes *openjdk*
rpm -ivh "https://archive.cloudera.com/director/redhat/7/x86_64/director/2.8.0/RPMS/x86_64/oracle-j2sdk1.8-1.8.0+update121-1.x86_64.rpm"

# Add the Cloudera Director repository to the package manager
curl -o /etc/yum.repos.d/cloudera-director.repo https://archive.cloudera.com/director/redhat/7/x86_64/director/cloudera-director.repo
sed -i.bak 's/director\/2/director\/2.8.0/g' /etc/yum.repos.d/cloudera-director.repo

# Install Cloudera Director server and client
yum -y install cloudera-director-server cloudera-director-client
service cloudera-director-server start
