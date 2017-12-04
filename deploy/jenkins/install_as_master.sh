#! /bin/sh
# Install Java
echo "Install Java"
apt-get install -y openjdk-8-jre-headless
# Install Jenkins
JENKINS_ROOT=/var/lib/jenkins
JENKINS_HOME=$JENKINS_ROOT/jenkins_home
JENKINS_NODE=$JENKINS_ROOT/jenkins_node
rm -fr $JENKINS_ROOT
mkdir -p $JENKINS_ROOT
mkdir -p $JENKINS_HOME
mkdir -p $JENKINS_NODE
export JENKINS_HOME
cd $JENKINS_ROOT
wget http://updates.jenkins-ci.org/download/war/2.73.3/jenkins.war
nohup java -jar $JENKINS_ROOT/jenkins.war --httpPort=8080 > jenkins.out 2>&1 &