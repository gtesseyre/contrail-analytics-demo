#A Shell Script to give a tour of Contrail Analytics UVEs
echo  ---------------------------------
echo "|          UVEs TOUR            |"
echo  ---------------------------------
read -p "Press enter to continue" pause
echo
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics | python -m json.tool


echo  ---------------------------------
echo "|          UVE LIST             |"
echo  ---------------------------------
read -p "Press enter to continue" pause
echo
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves | python -m json.tool


echo  ---------------------------------
echo "|       VIRTUAL NETWORK UVE     |"
echo  ---------------------------------
read -p "Press enter to continue" pause
echo
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/virtual-network/default-domain:sandbox16:public-user16-net?flat | python -m json.tool | more


echo  --------------------------------------
echo "|       EXEMPLE OF SOURCE FILTER     |"
echo  --------------------------------------
read -p "Press enter to continue" pause

echo  ------------------------------------------------------------
echo "|       VN UVE FILTERING PER COMPUTE - SFILT compute 1     |"
echo  ------------------------------------------------------------
read -p "Press enter to continue" pause
echo
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/virtual-network/default-domain:sandbox16:public-user16-net?sfilt=dc4-compute-1 | python -m json.tool | more

echo  ------------------------------------------------------------
echo "|       VN UVE FILTERING PER COMPUTE - SFILT compute 2     |"
echo  ------------------------------------------------------------
read -p "Press enter to continue" pause
echo
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/virtual-network/default-domain:sandbox16:public-user16-net?sfilt=dc4-compute-2 | python -m json.tool | more

echo  --------------------------------------------------
echo "|       EXEMPLE OF SPECIFIC STRUCTURE FILTER     |"
echo  --------------------------------------------------
read -p "Press enter to continue" pause

echo  -----------------------------------------------------------
echo "|      DATABASE NODE UVE  - FILTERING ON COMPACTION TASK  |"
echo  -----------------------------------------------------------
read -p "Press enter to continue" pause
echo
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/database-node/dc4-cfg-1?flat| python -m json.tool | more
read -p "Press enter to continue" pause

echo  -----------------------------------------------------------
echo "|     LET'S FILTER on CassandraStatusData		  	|"
echo  -----------------------------------------------------------
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/database-node/dc4-cfg-1?cfilt=CassandraStatusData | python -m json.tool | more
read -p "Press enter to continue" pause

echo  ---------------------------------------------------------------------------------------
echo "|    LET'S FILTER on CassandraStatusData:cassandra_compaction_task		    |"
echo  ---------------------------------------------------------------------------------------
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/database-node/dc4-cfg-1?cfilt=CassandraStatusData:cassandra_compaction_task | python -m json.tool | more
read -p "Press enter to continue" pause

echo  --------------------
echo "|    AND SO ON ....|"
echo  --------------------
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/database-node/dc4-cfg-1?cfilt=DatabaseUsageInfo | python -m json.tool | more
read -p "Press enter to continue" pause
