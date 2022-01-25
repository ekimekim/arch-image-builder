
set -eu

# Set root password
chpasswd < /setup/password

# Install ssh key
install -D -m 600 /setup/ssh-key /root/.ssh/authorized_keys

# Install ZFS
cat >> /etc/pacman.conf <<-EOF
	[archzfs]
	Server = https://zxcvfdsa.com/archzfs/\$repo/\$arch
	Server = http://archzfs.com/\$repo/x86_64
EOF
pacman-key --add /setup/archzfs.gpg
pacman-key --lsign-key DDF7DB817396A49B2A2723F7403BD972F75D9D76
pacman -Sy --noconfirm zfs-dkms

# Import pool on boot
systemctl enable zfs-import-scan

# Run docker out of a tmpfs for performance
cat >> /etc/fstab <<-EOF
	tmpfs /var/lib/docker tmpfs size=16G,mode=0710 0 0
EOF

# Start sshd, dhcp and docker on boot
systemctl enable sshd dhcpcd docker
