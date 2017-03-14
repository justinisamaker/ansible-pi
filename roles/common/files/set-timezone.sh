# Set time zone and time 
echo "America/Chicago" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata