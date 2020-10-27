Vagrant.configure("2") do |config|
  config.vm.box_check_update = false
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
  config.vm.define "moodle" do |moodle|
    moodle.vm.box = "bento/ubuntu-18.04"
    moodle.vm.hostname = "Moodle"
    moodle.vm.network "private_network", ip: "192.168.100.200"
    moodle.vm.network "forwarded_port", guest: 3306 , host: 3306 # MySQL 
    moodle.vm.network "forwarded_port", guest: 80 , host: 8888 # Apache web server 
    moodle.vm.provision "shell", path: "bootstrap.sh"
    moodle.vm.provider "virtualbox" do |v|
      v.memory = 4096 
      v.cpus = 2
    end
  end
end
  