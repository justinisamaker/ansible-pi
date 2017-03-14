# Non-interactive command-line equivalents to raspi-config
#  These are not guaranteed to work under all circumstances.
#  I use them in a fabric script to do unattended setup of a
#  Raspberry Pi immediately after having booted up a NOOBS
#  and installed Raspbian.
#
#   1. Install NOOBS
#   2. When the config screen comes up, hit TAB TAB RETURN to exit from it
#   3. Type 'sudo service ssh start' at the command line (no quotes).
#   4. (Optional) copy a public key to the pi account on the pi.

# Do everything as root. I'm using fabric, but you can just
# use the commands if you first run sudo -s

# Set locale to en_US.UTF-8
cp /etc/locale.gen /etc/locale.gen.dist
sed -i -e "/^[^#]/s/^/#/" -e "/en_US.UTF-8/s/^#//" /etc/locale.gen

cp /var/cache/debconf/config.dat /var/cache/debconf/config.dat.dist
sed -i -e "/^Value: en_GB.UTF-8/s/en_GB/en_US/" \
       -e "/^ locales = en_GB.UTF-8/s/en_GB/en_US/" /var/cache/debconf/config.dat
locale-gen
update-locale LANG=en_US.UTF-8

# At this point, either log out and log in again, or reboot.
# Rebooting seems easier if this is really being run from fabric.
# If you do any upgrades, you may have to run the locale commands again

# Set timezone to America/Chicago
cp /etc/timezone /etc/timezone.dist
echo "America/Chicago" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Set the keyboard to US, don't set any modifier keys, etc.
cp /etc/default/keyboard /etc/default/keyboard.dist
sed -i -e "/XKBLAYOUT=/s/gb/us/" /etc/default/keyboard
service keyboard-setup restart