# This script updates google's Dynamic dns record with our current IP.
# Can't use USG's builtin DynDns, because USG is behind another router and uses its WAN ip of 192.168.2.1
# Can't use builtin DynDns for Frotnier's modem, because it doesn't support google's DynDns (only dyndns.com and noip.com).

USERNAME="my_secret_user_name"
PASSWORD="my_secret_password"
HOSTNAME="my_test_domain.biocomp.me"

# Resolve current public IP
IP=$(host myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has" | awk '{print $4}')
echo "Dynamic dns, updating IP to ${IP}"
URL="https://${USERNAME}:${PASSWORD}@domains.google.com/nic/update?hostname=${HOSTNAME}&myip=${IP}"
curl -s ${URL}