import subprocess as sp

ip = "192.168.0.1"
status,result = sp.getstatusoutput("ping -c1 -w2 " + ip)

if status == 0: 
    print("Main router " + " is Alive !")
else:
    print("Main  router " + " is DOWN !")

ip = "192.168.0.110"
status,result = sp.getstatusoutput("ping -c1 -w2 " + ip)

if status == 0: 
    print("Hyper-V server " + " is Alive !")
else:
    print("Hyper-V server " + " is DOWN !")

ip = "192.168.0.21"
status,result = sp.getstatusoutput("ping -c1 -w2 " + ip)

if status == 0: 
    print("Wiki server " + " is Alive !")
else:
    print("Wiki server " + " is DOWN !") 
  
ip = "192.168.0.24"
status,result = sp.getstatusoutput("ping -c1 -w2 " + ip)

if status == 0: 
    print("Jira server " + " is Alive !")
else:
    print("Jira server " + " is DOWN !")

ip = "192.168.0.22"
status,result = sp.getstatusoutput("ping -c1 -w2 " + ip)

if status == 0: 
    print("PDM server " + " is Alive !")
else:
    print("PDM server " + " is DOWN !")

ip = "192.168.0.200"
status,result = sp.getstatusoutput("ping -c1 -w2 " + ip)

if status == 0: 
    print("DNS\DHCP server " + " is Alive !")
else:
    print("DNS\DHCP server " + " is DOWN !")

ip = "192.168.0.201"
status,result = sp.getstatusoutput("ping -c1 -w2 " + ip)

if status == 0: 
    print("Gitlab server " + " is Alive !")
else:
    print("Gitlab server " + " is DOWN !")

ip = "192.168.0.253"
status,result = sp.getstatusoutput("ping -c1 -w2 " + ip)

if status == 0: 
    print("Slow-runner server " + " is Alive !")
else:
    print("Slow-runner server " + " is DOWN !")

ip = "192.168.1.29"
status,result = sp.getstatusoutput("ping -c1 -w2 " + ip)

if status == 0: 
    print("Fast-runner server " + " is Alive !")
else:
    print("Fast-runner server " + " is DOWN !")
