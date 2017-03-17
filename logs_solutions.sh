#A Shell Script to provide solutions to the logs exercise
echo "Question: Who is the Zookeeper leader in the cluster ?"
read -p "" pause
echo "Answer:"
echo "cd /opt/contrail/utils"
echo 'fab all_command:"cat /var/log/zookeeper/zookeeper.log | grep LEADER"'
echo ---------------------------------------------------------------------------------
echo ---------------------------------------------------------------------------------

echo "Question: Which process used in analytics is not running ? "
read -p "" pause
echo "Answer:"
echo "tail -f /var/log/redis/redis-server.log"
echo ---------------------------------------------------------------------------------
echo ---------------------------------------------------------------------------------

echo "Question: Is the connection between contrail-api and RabbitMQ established ? "
read -p "" pause
echo "Answer:"
echo "cat /var/log/contrail/contrail-api.log | grep RabbitMQ"
echo ---------------------------------------------------------------------------------
echo ---------------------------------------------------------------------------------

echo "Question: Is the connection between contrail-api and Zookeeper established ? "
read -p "" pause
echo "Answer:"
echo "tail -f /var/log/contrail/api-0-zk.log"
echo ---------------------------------------------------------------------------------
echo ---------------------------------------------------------------------------------

echo "Question: What was the last action performed on the Contrail API of dc4-ctrl-2 ?"
read -p "" pause
echo "Answer:"
echo "cat /var/log/contrail/api-0-zk.log | grep connection"
echo ---------------------------------------------------------------------------------
echo ---------------------------------------------------------------------------------
