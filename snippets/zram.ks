%packages
zram-generator
%end

%post
{
echo "Configuring swap-on-zram"
cat << EOF > /etc/systemd/zram-generator.conf
[zram0]
# This section describes the settings for /dev/zram0.
#
# The maximum amount of memory (in MiB). If the machine has more RAM
# than this, zram device will not be created.
#
# The default is 2048 MiB, i.e. the device is only created on machines
# with limited memory.
#
# "memory-limit = none" may be used to disable this limit.
memory-limit = none

# The fraction of memory to use as ZRAM. For example, if the machine
# has 1 GiB, and zram-fraction=0.25, then the zram device will have
# 256 MiB. Values in the range 0.10–0.40 are recommended.
#
# The default is 0.25.
zram-fraction = 0.5
EOF
} 2>&1 | tee -a /root/postinstall.log > /dev/tty3
%end
