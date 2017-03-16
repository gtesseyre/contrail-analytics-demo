#A Shell Script to provide solutions to the UVEs exercise
echo "Question: What is the number of BGP peers ?"
read -p "" pause
echo "Answer:"
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/control-node/dc4-cfg-1?cfilt=BgpRouterState:num_bgp_peer | python -m json.tool


echo "Question: How many BGP peerings are up ?"
read -p "" pause
echo "Answer:"
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/control-node/dc4-cfg-1?cfilt=BgpRouterState:num_up_bgp_peer | python -m json.tool


echo "Question: What is the local AS number ?"
read -p "" pause
echo "Answer:"
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/control-node/dc4-cfg-1?cfilt=BgpRouterState:local_asn | python -m json.tool


echo "Question: What is the state of contrail-schema process on dc4-cfg-1 ?"
read -p "" pause
echo "Answer:"
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/config-node/dc4-cfg-1?cfilt=NodeStatus:process_info | python -m json.tool | grep -A 1 contrail-schema

curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/config-node/dc4-cfg-1?cfilt=NodeStatus:process_status | python -m json.tool | grep -A 1 '"module_id": "contrail-schema"'


echo "Question: What is the number of XMPP peers on dc4-ctrl-2 ?"
read -p "" pause
echo "Answer:"
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/control-node/dc4-cfg-1?cfilt=BgpRouterState:num_xmpp_peer | python -m json.tool


echo "Question: Is DPDK enabled on this cluster ?"
read -p "" pause
echo "Answer:"
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/vrouter/dc4-compute-1?cfilt=ContrailConfig:elements | python -m json.tool | grep display_name
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/vrouter/dc4-compute-1?cfilt=ContrailConfig:elements | python -m json.tool | grep dpdk

curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/vrouter/dc4-compute-2?cfilt=ContrailConfig:elements | python -m json.tool | grep display_name
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/vrouter/dc4-compute-2?cfilt=ContrailConfig:elements | python -m json.tool | grep dpdk

curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/vrouter/dc4-compute-3?cfilt=ContrailConfig:elements | python -m json.tool | grep display_name
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/vrouter/dc4-compute-3?cfilt=ContrailConfig:elements | python -m json.tool | grep dpdk

curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/vrouter/dc4-compute-4?cfilt=ContrailConfig:elements | python -m json.tool | grep display_name
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/vrouter/dc4-compute-4?cfilt=ContrailConfig:elements | python -m json.tool | grep dpdk

curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/vrouter/dc4-compute-3-1?cfilt=ContrailConfig:elements | python -m json.tool | grep display_name
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/vrouter/dc4-compute-3-1?cfilt=ContrailConfig:elements | python -m json.tool | grep dpdk


echo "Question: How many virtual-machines are on compute 2 ?"
read -p "" pause
echo "Answer:"
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/vrouter/dc4-compute-2?cfilt=VrouterAgent:virtual_machine_list | python -m json.tool

echo "Question: Is there any packet drops on compute 1 ?"
read -p "" pause
echo "Answer:"
curl -X GET -H "X-Auth-Token: $TOKEN" http://$ANALYTICS_IP:8081/analytics/uves/vrouter/dc4-compute-1?flat | python -m json.tool | grep drop | grep -v 0 | grep -v {
