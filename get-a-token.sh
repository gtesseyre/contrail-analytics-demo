#Get a token
REQUEST="{\"auth\": {\"tenantName\":\"$OS_TENANT_NAME\", \"passwordCredentials\": {\"username\": \"$OS_USERNAME\", \"password\": \"$OS_PASSWORD\"}}}"
RAW_TOKEN=`curl -s -d "$REQUEST" -H "Content-type: application/json" "http://$KEYSTONE_IP:5000/v2.0/tokens"`
TOKEN=`echo $RAW_TOKEN | python -c "import sys; import json; tok = json.loads(sys.stdin.read()); print tok['access']['token']['id'];"`
export TOKEN
echo $TOKEN
