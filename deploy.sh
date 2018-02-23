#!/bin/bash
if [ $ENVIRONMENT == QA ]  
then
echo "Deploying the code into QA environment"
sshpass -p "madhu1" scp ${WORKSPACE}/target/ekart.war madhu1@172.17.0.2:/home/madhu/soft/apache-tomcat-8.5.27/webapps

sshpass -p "madhu1" ssh madhu1@172.17.0.2 "JAVA_HOME=/home/madhu/soft/jdk1.8.0_161" "/home/madhu/soft/apache-tomcat-8.5.27/bin/startup.sh"

elif [ $ENVIRONMENT == SIT ] 
then
echo "Deploying the code into SIT environment"
sshpass -p "madhu2" scp ${WORKSPACE}/target/ekart.war madhu2@172.17.0.3:/home/madhu/soft/apache-tomcat-8.5.27/webapps

sshpass -p "madhu2" ssh madhu2@172.17.0.3 "JAVA_HOME=/home/madhu/soft/jdk1.8.0_161" "/home/madhu/soft/apache-tomcat-8.5.27/bin/startup.sh"
elif [ $ENVIRONMENT == PROD ]
then
   echo "No Environment"
fi

