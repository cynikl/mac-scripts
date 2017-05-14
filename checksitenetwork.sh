# rtrouton on jamf nation
# https://www.jamf.com/jamf-nation/discussions/16993/9-8-upgrade-self-service-down#responseChild99981

CheckSiteNetwork (){

  #  CheckSiteNetwork function adapted from Facebook's check_corp function script.
  #  check_corp script available on Facebook's IT-CPE Github repo:
  #
  # check_corp:
  #   This script verifies a system is on the corporate network.
  #   Input: CORP_URL= set this to a hostname on your corp network
  #   Optional ($1) contains a parameter that is used for testing.
  #   Output: Returns a check_corp variable that will return "True" if on 
  #   corp network, "False" otherwise.
  #   If a parameter is passed ($1), the check_corp variable will return it
  #   This is useful for testing scripts where you want to force check_corp
  #   to be either "True" or "False"
  # USAGE: 
  #   check_corp        # No parameter passed
  #   check_corp "True"  # Parameter of "True" is passed and returned


  site_network="False"
  ping=`host -W .5 $jss_server_address`

  # If the ping fails - site_network="False"
  [[ $? -eq 0 ]] && site_network="True"

  # Check if we are using a test
  [[ -n "$1" ]] && site_network="$1"
}

CheckSiteNetwork

if [[ "$site_network" == "False" ]]; then
    /usr/bin/logger "Unable to verify access to site network. Exiting."
fi 


if [[ "$site_network" == "True" ]]; then
    /usr/bin/logger "Access to site network verified"
    CheckTomcat
    CheckLogAge
    CheckBinary
    UpdateManagementAndInventory
    SelfDestruct
fi
exit 0


# nc -z -w 5 $server_address $$server_port > /dev/null; echo $?`
