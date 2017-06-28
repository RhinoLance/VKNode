#!/usr/bin/env sh

#Author: RhinoLance

# This script will generate SSL certificates and install them in Raspbian running
# a Lighttpd web server.

#Get certificates
if ! /home/pi/.acme.sh/acme.sh --issue --dns dns_dreamhost -d marconi.conryclan.com -d marconi.gaul.conryclan.com; then
        echo "No certficates created"
        exit 1
fi

echo "New certficates created"
echo "Installing certificates"

#Copy new certs
cat /root/.acme.sh/marconi.conryclan.com/marconi.conryclan.com.key /root/.acme.sh/marconi.conryclan.com/marconi.conryclan.com.cer /etc/lighttpd/marconi.conryclan.com.pem

echo "Certs installed"
echo "Restarting lighttpd web server"

/etc/init.d/lighttpd restart

echo "All done"
