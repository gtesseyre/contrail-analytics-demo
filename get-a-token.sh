#Enter your setup credentials
export OS_USERNAME=$OPENSTACK_USER_NAME
export OS_PASSWORD=$OPENSTACK_USER_PASSWORD
export OS_TENANT_NAME=$OPENSTACK_TENANT_NAME
export OS_AUTH_URL=http://$KEYSTONE_IP:5000/v2.0/
export KEYSTONE_IP=$KEYSTONE_IP
export ANALYTICS_IP=$ANALYTICS_IP

#Get a token
REQUEST="{\"auth\": {\"tenantName\":\"$OS_TENANT_NAME\", \"passwordCredentials\": {\"username\": \"$OS_USERNAME\", \"password\": \"$OS_PASSWORD\"}}}"
RAW_TOKEN=`curl -s -d "$REQUEST" -H "Content-type: application/json" "http://$KEYSTONE_IP:5000/v2.0/tokens"`
TOKEN=`echo $RAW_TOKEN | python -c "import sys; import json; tok = json.loads(sys.stdin.read()); print tok['access']['token']['id'];"`
export TOKEN
echo $TOKEN
