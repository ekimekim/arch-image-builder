# Set root password
echo root:goldbrick | chpasswd
# Install my_file
install -m 600 /setup/my_file /root
# Start ssh
systemctl enable sshd
