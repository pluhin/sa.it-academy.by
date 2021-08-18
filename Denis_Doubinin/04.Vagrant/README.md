## Vagrant box

## Vagrant boxes

[MyVagrantBox](https://app.vagrantup.com/denisdoubinin/boxes/testd/versions/1.0.0)


## Push to vagrantcloud

```bash
[denis@denis-PC 16.Jenkins.Start]$ vagrant cloud publish --release denisdoubinin/testd 1.0.0 virtualbox /tmp/test.box
You are about to publish a box on Vagrant Cloud with the following options:
denisdoubinin/testd:   (v1.0.0) for provider 'virtualbox'
Automatic Release:     true
Do you wish to continue? [y/N]y
Saving box information...
Uploading provider with file /tmp/test.box
Releasing box...
Complete! Published denisdoubinin/testd
Box:              denisdoubinin/testd
Description:      
Private:          no
Created:          2021-07-20T17:40:21.234+03:00
Updated:          2021-07-20T17:40:21.234+03:00
Current Version:  N/A
Versions:         1.0.0
Downloads:        0

```
## Comment

There is a problem with vagrant vbguest plugin, reinstall all SW (VirtualBox, Vagrant, vagrant plugins, ruby) didn'help. Helps downgrade vagrant vbguest plugin from version 0.30 to version 0.21.
