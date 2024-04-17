# Power management

## Control latptop charging

### install tlp and acpi-call
```
sudo apt install tlp tlp-rdw
sudo apt install acpi-call-dkms
```  

### configure tlp
* `sudo nano /etc/tlp.conf`
* add lines:
```
START_CHARGE_THRESH_BAT0=75
STOP_CHARGE_THRESH_BAT0=80
```

### restart tlp
`sudo tlp start`

### check tlp settings
`sudo tlp-stat -b`
