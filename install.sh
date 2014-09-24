echo 'Now installing b43 firmware...'
echo 'Please check you run this script as Administrator...'

cd /tmp
wget http://bues.ch/b43/fwcutter/b43-fwcutter-018.tar.bz2 http://bues.ch/b43/fwcutter/b43-fwcutter-018.tar.bz2.asc
gpg --verify b43-fwcutter-018.tar.bz2.asc
tar xjf b43-fwcutter-018.tar.bz2
cd b43-fwcutter-018
echo 'Making Software'
make
echo 'Installing Software'
sudo make install
echo 'finished Installing Software b43-fwcutter-0.18'

cd /tmp
export FIRMWARE_INSTALL_DIR="/lib/firmware"
wget http://www.lwfinger.com/b43-firmware/broadcom-wl-5.100.138.tar.bz2
tar xjf broadcom-wl-5.100.138.tar.bz2
echo 'Installing Kernel'
sudo b43-fwcutter -w "$FIRMWARE_INSTALL_DIR" broadcom-wl-5.100.138/linux/wl_apsta.o
echo 'Finished Installing Kernel broadcom-wl'

