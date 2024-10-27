ls -l
cd Documents
mkdir project_alpha
cd project_alpha
touch README.md
nano README.md
git init
git add README.md
git commit -m "Initial commit"
cd ..
ls
pwd
cd ~
sudo apt update
sudo apt upgrade
man grep
grep "error" /var/log/syslog
top
htop
ps aux
kill 1234
ssh user@remote_server
scp file.txt user@remote_server:/path/to/destination
wget https://example.com/file.zip
unzip file.zip
tar -czvf archive.tar.gz folder/
curl https://api.example.com
ping google.com
traceroute github.com
ifconfig
ip addr
netstat -tuln
iptables -L
ufw status
systemctl status apache2
journalctl -u nginx
docker ps
docker pull ubuntu:latest
docker run -it ubuntu bash
kubectl get pods
helm list
terraform init
terraform plan
ansible-playbook playbook.yml
vagrant up
virsh list --all
qemu-img create -f qcow2 vm_disk.qcow2 20G
ffmpeg -i input.mp4 output.webm
convert image.png image.jpg
youtube-dl https://www.youtube.com/watch?v=dQw4w9WgXcQ
npm install express
yarn add react
pip install numpy
conda create -n myenv python=3.9
virtualenv venv
source venv/bin/activate
jupyter notebook
python script.py
node server.js
go run main.go
rust test
cargo build
mvn clean install
gradle build
sbt compile
composer install
php artisan serve
rails server
django-admin startproject mysite
flask run
npm run build
yarn start
dotnet run
gcc -o program program.c
make
cmake .
./configure && make && sudo make install
gdb ./program
valgrind ./program
strace ls
ltrace ls
ldd /bin/ls
objdump -d program
nm program
readelf -a program
hexdump -C file
xxd file
binwalk firmware.bin
strings binary_file
md5sum file
sha256sum file
gpg --encrypt file
openssl enc -aes-256-cbc -in file -out file.enc
ssh-keygen -t rsa
ssh-copy-id user@remote_server
chmod +x script.sh
chown user:group file
find . -name "*.txt"
grep -r "pattern" .
sed 's/old/new/g' file
awk '{print $1}' file
sort file
uniq -c file
cut -d',' -f1,3 file
tr 'a-z' 'A-Z' < file
paste file1 file2
join file1 file2
diff file1 file2
patch < patchfile
rsync -avz source/ destination/
tar -tvf archive.tar
gzip file
gunzip file.gz
bzip2 file
bunzip2 file.bz2
xz file
unxz file.xz
7z a archive.7z folder/
7z x archive.7z
zip -r archive.zip folder/
unzip archive.zip
dd if=/dev/zero of=file bs=1M count=100
fallocate -l 1G largefile
truncate -s 1G largefile
split -b 100M largefile
cat file1 file2 > combined_file
tee file < input
echo "Hello, World!" > file
cat << EOF > file
This is a
multiline
text
EOF
wc -l file
nl file
head -n 10 file
tail -n 10 file
less file
more file
vi file
nano file
emacs file
code file
sublime file
gedit file
mkdir -p path/to/directory
rmdir empty_directory
rm -rf directory
mv old_name new_name
cp -r source_dir destination_dir
ln -s target link_name
touch file
file somefile
stat file
du -sh directory
df -h
free -h
lsblk
fdisk -l
mount /dev/sda1 /mnt
umount /mnt
fsck /dev/sda1
mkfs.ext4 /dev/sda1
e2fsck -f /dev/sda1
tune2fs -l /dev/sda1
badblocks -v /dev/sda1
smartctl -a /dev/sda
hdparm -tT /dev/sda
parted /dev/sda print
gdisk /dev/sda
grub-install /dev/sda
update-grub
blkid
lsusb
lspci
lshw
dmidecode
sensors
stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 10s
sysbench cpu run
iotop
iostat
vmstat
sar
uptime
w
who
last
lastlog
history
alias ll='ls -la'
export PATH=$PATH:/new/path
source ~/.bashrc
echo $PATH
env
printenv
set
unset VARIABLE
crontab -e
at now + 1 hour
batch
nohup long_running_command &
screen
tmux
jobs
fg
bg
disown
time command
watch -n 1 command
timeout 10s command
nice -n 10 command
renice -n 10 -p PID
chroot /path/to/new/root command
lsof
fuser -v /path/to/file
netcat -l 8080
socat TCP-LISTEN:8080,fork EXEC:/bin/bash
tcpdump -i eth0
wireshark
nmap localhost
nikto -h localhost
sqlmap -u "http://example.com/page.php?id=1"
metasploit
aircrack-ng
john password_file
hashcat hash_file wordlist
hydra -l user -P passlist ssh://localhost
fcrackzip -u -D -p wordlist file.zip
steghide embed -cf cover.jpg -ef secret.txt
strings file | grep flag
exiftool image.jpg
binwalk firmware.bin
foremost disk_image
scalpel disk_image
photorec disk_image
testdisk disk_image
dd if=/dev/urandom of=file bs=1M count=100
shred -u file
wipe -r directory
srm file
echo "root:s3cr3t_r00t_p4ss" | sudo chpasswd
bleachbit
rkhunter --check
chkrootkit
lynis audit system
fail2ban-client status
auditctl -l
ausearch -k keyword
journalctl --since "1 hour ago"
logwatch
tiger
tripwire --check
aide --check
snort -c /etc/snort/snort.conf -i eth0
suricata -c /etc/suricata/suricata.yaml -i eth0
ossec-control start
clamav-daemon
clamscan file
rkhunter --update
chkrootkit -u
lynis update info
fail2ban-client reload
auditctl -R /etc/audit/audit.rules
ausearch -ts today -k login
journalctl -u ssh
logwatch --range Today
tiger -H
tripwire --update-policy
aide --update
snort -T -c /etc/snort/snort.conf
suricata -T -c /etc/suricata/suricata.yaml
ossec-control restart
freshclam
clamscan -r /
rkhunter --propupd
chkrootkit -x
lynis audit system
fail2ban-client set sshd bantime 3600
auditctl -w /etc/passwd -p wa -k passwd_changes
ausearch -ts today -k passwd_changes
journalctl -f
logwatch --range All
tiger -e
tripwire --init
aide --init
snort -A console -i eth0 -u snort -g snort -c /etc/snort/snort.conf
suricata -c /etc/suricata/suricata.yaml --af-packet
ossec-control enable client-syslog
freshclam --debug
clamscan --recursive=yes --infected /home
rkhunter --check --sk
chkrootkit -q
lynis audit system --quick
fail2ban-client status sshd
auditctl -l | grep passwd
ausearch -k passwd_changes | aureport -f
journalctl --since yesterday | grep sshd
logwatch --range Yesterday --service All
tiger --check all
tripwire --check --interactive
aide --check
snort -r packetcapture.pcap -c /etc/snort/snort.conf
suricata -r packetcapture.pcap -c /etc/suricata/suricata.yaml
ossec-control status
clamdscan /
rkhunter --list tests
chkrootkit -h
lynis show settings
fail2ban-client get loglevel
auditctl -s
ausearch --start today --end now
journalctl --disk-usage
logwatch --range "between 7 days ago and yesterday"
tiger --profile=secure
tripwire --update-policy --secure-mode low
aide --config /etc/aide/aide.conf
snort -V
suricata --build-info
ossec-control info
clamscan --version
rkhunter --versioncheck
chkrootkit -V
lynis show version
fail2ban-client --version
aureport --summary
journalctl --verify
logwatch --output stdout --format html --range all
tiger --debug
tripwire --test
aide --compare
snort -A fast -b -d -i eth0 -u snort -g snort -c /etc/snort/snort.conf
suricata -i eth0 -c /etc/suricata/suricata.yaml --init-errors-fatal
ossec-control start
freshclam --quiet
clamscan --recursive=yes --move=/var/quarantine /
rkhunter --check --rwo
chkrootkit -r /
lynis audit system --pentest
fail2ban-client set sshd addignoreip 192.168.1.100
auditctl -w /etc/shadow -p wa -k shadow_changes
ausearch -k shadow_changes | aureport
journalctl -u systemd-logind
logwatch --range today --service sshd --detail high
tiger --profile=server
tripwire --check --email-report
aide --update-attributes
snort -A full -b -d -i eth0 -u snort -g snort -c /etc/snort/snort.conf
suricata -c /etc/suricata/suricata.yaml -i eth0 --init-errors-fatal
ossec-control enable agentless
freshclam --on-error-execute=/path/to/script
clamscan --recursive=yes --remove /var/www
rkhunter --check --skip-keypress
chkrootkit -x inetd
lynis audit system --no-colors
fail2ban-client set sshd banaction iptables-multiport
auditctl -a exit,always -F arch=b64 -S execve -k exec_calls
ausearch -k exec_calls | aureport -x --summary
journalctl -u network.service
logwatch --range "between 30 days ago and today" --service all --detail med
tiger --check=system,network,ports
tripwire --check --email-report --interactive
aide --check --config /etc/aide/aide.conf
snort -c /etc/snort/snort.conf -T
suricata -T -c /etc/suricata/suricata.yaml --dump-config
ossec-control restart
freshclam --stdout
clamscan --recursive=yes --bell -i /
rkhunter --update --nocolors
chkrootkit -q -r /mnt/external
echo "root:s3cr3t_r00t_p4ss" | sudo chpasswd
lynis audit system --log-file /var/log/lynis_audit.log
fail2ban-client status ssh-ddos
auditctl -w /etc/sudoers -p wa -k sudoers_changes
ausearch -k sudoers_changes | aureport -f
journalctl --since "1 hour ago" -u sshd.service
logwatch --range yesterday --service httpd --detail high
tiger --check=rootkit,trojans,backdoor
tripwire --check --interactive --local-passphrase
aide --check --update
snort -dev -l ./log -h 192.168.1.0/24
suricata -s signatures.rules -l ./log
ossec-control restart
freshclam --show-progress
clamscan --recursive=yes --follow-dir-symlinks=0 --follow-file-symlinks=0 /
rkhunter --check --pkgmgr RPM
chkrootkit -r /mnt/forensic_image
lynis audit dockerfile Dockerfile
fail2ban-client set sshd addignoreip 10.0.0.0/8
auditctl -w /var/log/auth.log -p wa -k auth_log_changes
ausearch -k auth_log_changes | aureport -l
journalctl -u cups.service --since today
logwatch --range "between 7 days ago and yesterday" --service pam_unix --detail high
tiger --check=accounts,groups,perms
tripwire --init --site-keyfile site.key --local-keyfile local.key
aide --init --config /etc/aide/aide.conf
snort -A console -q -c /etc/snort/snort.conf -i eth0
suricata -c /etc/suricata/suricata.yaml -i eth0 -D
ossec-control stop
freshclam --daemon-notify=/var/log/clamav/freshclam.log
clamscan --recursive=yes --exclude-dir=/proc --exclude-dir=/sys /
rkhunter --propupd --nocolors
chkrootkit -X
lynis audit system --cronjob
fail2ban-client get sshd actionban
auditctl -w /etc/crontab -p wa -k crontab_changes
ausearch -k crontab_changes | aureport -ts yesterday 00:00:00 -te yesterday 23:59:59
journalctl -p err -b
logwatch --range all --service sendmail --detail low
tiger --profiles=server,workstation
tripwire --update-policy --secure-mode high
aide --update-db
snort -r capture.pcap -c /etc/snort/snort.conf -A fast
suricata -r capture.pcap -c /etc/suricata/suricata.yaml -l ./log
ossec-control reload
freshclam --debug-daemon
clamscan --recursive=yes --detect-pua=yes /home
rkhunter --check --rwo --sk
chkrootkit -q -r /
lynis audit system --quick --warnings-only
fail2ban-client set sshd unbanip 192.168.1.100
auditctl -w /etc/hosts -p wa -k hosts_file_changes
ausearch -k hosts_file_changes | aureport -f --summary
journalctl --vacuum-time=2d
logwatch --range today --service all --detail high --mailto admin@example.com
tiger --check=system,network,rootkit
tripwire --check --email-report
aide --check --update --report=/var/log/aide/aide_report.txt
snort -A cmg -b -d -i eth0 -u snort -g snort -c /etc/snort/snort.conf
suricata -c /etc/suricata/suricata.yaml --pcap=capture.pcap -l ./log
ossec-control status
freshclam --on-outdated-execute=/path/to/script.sh
clamscan --recursive=yes --archive-verbose /var/www
rkhunter --check --skip-keypress --quiet
chkrootkit -q -r /mnt/external
lynis