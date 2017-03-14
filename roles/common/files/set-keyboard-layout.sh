# set the keyboard layout
sed -i -e 's/gb/us/g' /etc/default/keyboard
dpkg-reconfigure -f noninteractive keyboard-configuration
dpkg-reconfigure -f noninteractive console-setup