# Set root password
echo 'root:spitefully middleweight' | chpasswd
# Install ssh key
install -D -m 600 /setup/ssh-key /root/.ssh/authorized_keys
# Start sshd and dhcp on boot
systemctl enable sshd dhcpcd
