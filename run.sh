# edit /etc/hostname manually


# update packages 
apt -y update
apt -y remove cryptsetup-initramfs #optional, karena kadang-kadang kalau apt-get upgrade jadi macet di sini
apt -y upgrade

# standard packages
apt -y install mysql-server mysql-common mysql-client 
apt -y install apache2 software-properties-common ruby-rmagick  
apt -y install ruby-dev build-essential libmysqlclient-dev libssl-dev gcc libmysqlclient-dev
apt -y install libapache2-mod-passenger # untuk integrasi apache-passenger

#non standard but important
apt -y install libsqlite3-dev
apt -y install libgdbm-dev
apt -y install libgdbm-compat-dev
apt -y install imagemagick-6.q16
apt -y install libmagickcore-dev # untuk rmagick , menghindari pesan “ERROR: Can’t install RMagick 4.0.0.” 

# apt-file search ndbm.h  
# https://unix.stackexchange.com/questions/66841/ubuntu-cant-find-ndbm-h
# https://launchpad.net/ubuntu/+source/gdbm
# https://stackoverflow.com/questions/28324439/cant-install-rmagick-0-0-0-cant-find-magick-config
   
apt -y install redmine redmine-mysql
gem update
gem install bundler

cp passenger.conf /etc/apache2/mods-available/
cp 000-default.conf  /etc/apache2/sites-available

ln -s /usr/share/redmine/public /var/www/html/redmine
touch /usr/share/redmine/Gemfile.lock
chown www-data:www-data /usr/share/redmine/Gemfile.lock
apt autoremove
service apache2 restart



