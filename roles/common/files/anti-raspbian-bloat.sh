# Edu-related packages
pkgs="$pkgs
idle python3-pygame python-pygame python-tk
idle3 python3-tk
python3-rpi.gpio
python-serial python3-serial
python-picamera python3-picamera
python3-pygame python-pygame python-tk
python3-tk
debian-reference-en dillo x2x
scratch nuscratch
timidity
smartsim penguinspuzzle
pistore
sonic-pi
python3-numpy
python3-pifacecommon python3-pifacedigitalio python3-pifacedigital-scratch-handler python-pifacecommon python-pifacedigitalio
oracle-java8-jdk
minecraft-pi python-minecraftpi
wolfram-engine
"

# Remove packages
for i in $pkgs; do
	echo apt-get -y remove --purge $i
done

# rm extra raspbian dirs
rm -rf /home/pi/Desktop /home/pi/Documents /home/pi/Downloads /home/pi/Music /home/pi/oldconffiles /home/pi/Pictures /home/pi/Public /home/pi/python_games /home/pi/Templates /home/pi/Videos