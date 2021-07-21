## Push to vagrantcloud error

[denis@denis-PC 2](md-sa2-17-21)$ vagrant cloud publish --release denisdoubinin/testd 1.0.0 virtualbox /tmp/deb2.box
You are about to publish a box on Vagrant Cloud with the following options:
denisdoubinin/testd:   (v1.0.0) for provider 'virtualbox'
Automatic Release:     true
Do you wish to continue? [y/N]y
/opt/vagrant/embedded/gems/2.2.17/gems/vagrant_cloud-3.0.4/lib/vagrant_cloud/data.rb:217:in `initialize': wrong number of arguments (given 1, expected 0) (ArgumentError)
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant_cloud-3.0.4/lib/vagrant_cloud/box.rb:21:in `initialize'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant_cloud-3.0.4/lib/vagrant_cloud/data.rb:211:in `new'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant_cloud-3.0.4/lib/vagrant_cloud/data.rb:211:in `load'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant_cloud-3.0.4/lib/vagrant_cloud/organization.rb:16:in `block in initialize'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant_cloud-3.0.4/lib/vagrant_cloud/organization.rb:14:in `map'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant_cloud-3.0.4/lib/vagrant_cloud/organization.rb:14:in `initialize'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant_cloud-3.0.4/lib/vagrant_cloud/data.rb:211:in `new'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant_cloud-3.0.4/lib/vagrant_cloud/data.rb:211:in `load'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant_cloud-3.0.4/lib/vagrant_cloud/account.rb:100:in `organization'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant-2.2.17/plugins/commands/cloud/publish.rb:232:in `load_box'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant-2.2.17/plugins/commands/cloud/publish.rb:89:in `execute'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant-2.2.17/plugins/commands/cloud/root.rb:73:in `execute'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant-2.2.17/lib/vagrant/cli.rb:67:in `execute'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant-2.2.17/lib/vagrant/environment.rb:290:in `cli'
	from /opt/vagrant/embedded/gems/2.2.17/gems/vagrant-2.2.17/bin/vagrant:231:in `<main>'


Try to push different images (includ images from demo, have such error)
