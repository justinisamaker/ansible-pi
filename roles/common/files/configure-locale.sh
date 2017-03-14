# Make a copy of the locale file before we edit it
cp /etc/locale.gen /etc/local.gen.dist

# Comment out the en_GB entry in the locale file
sed -i -e 's/en_GB.UTF-8 UTF-8/# en_GB.UTF-8 UTF-8/g' /etc/locale.gen

# Uncomment the en_US entry in the locale file
sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen

# gen the locale
locale-gen

# replace the locale in the debconf dir
sed -i -e 's/en_GB/en_US/g' /var/cache/debconf/config.dat

# update lang in /etc/default/locale
sed -i -e 's/en_GB/en_US/g' /etc/default/locale