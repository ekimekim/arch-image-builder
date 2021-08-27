# Set root password
echo root:goldbrick | chpasswd
# Start ssh
systemctl enable sshd
