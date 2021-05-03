# install additional dependencies
# sudo apt-get install virtualbox-ext-pack virtualbox-guest-additions-iso
# use a variable to store VM name as we have to reuse it several times
VM='Windows10-64bit'
# create a VM (valid ostype values from `VBoxManage list ostypes`)
VBoxManage createvm --name "$VM" --ostype Windows10_64 --register
# set usable memory to 8 GB
VBoxManage modifyvm "$VM" --memory 8192
# set usable cpu to 2 logic core
VBoxManage modifyvm "$VM" --cpus 4
#add VGA pci
vboxmanage modifyvm "$VM" --pciattach 01:00.0@01:00.0
# create a hard disk (50 GB)
VBoxManage createhd --filename "$VM.vdi" --size 51200
# Attach the hard disk to the VM
VBoxManage storagectl "$VM" --name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storageattach "$VM" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$VM.vdi"
# Create a DVD drive with the installation media
VBoxManage storagectl "$VM" --name "IDE Controller" --add ide
VBoxManage storageattach "$VM" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium ~/Downloads/.iso
# Enable VirtualBox Remote Display Protocol
VBoxManage modifyvm "$VM" --vrde on
VBoxManage modifyvm "$VM" --vrdeport 4756
# Setup bridged network on VM ($host_iface must be a valid interface on the host as shown by ifconfig comand)
VBoxManage modifyvm "$VM" --nic1 bridged --bridgeadapter1 wlp2s0
# Power on
VBoxManage startvm "$VM" --type headless

# Power off

# VBoxManage controlvm "$VM" poweroff
# VBoxManage controlvm "Windows10-64bit" poweroff


# VBoxManage startvm "Windows10-64bit" --type headless

# VBoxManage unregistervm --delete  "Windows10-64bit"
