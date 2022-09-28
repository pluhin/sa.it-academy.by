## 19. Jenkins. Routine

### Screenshots

![Screenshot_7](https://user-images.githubusercontent.com/49452234/192873542-3eb2f7b2-7cfe-46ef-a25d-dc22bd98c3be.jpg)

### Console Output
```bash
Started by user admin
Running as SYSTEM
Building on the built-in node in workspace /var/lib/jenkins/workspace/homevork_19.1
[homevork_19.1] $ /bin/bash /tmp/jenkins16728307803099007497.sh
-----Ping Remote host-----
PING 192.168.1.80 (192.168.1.80) 56(84) bytes of data.
64 bytes from 192.168.1.80: icmp_seq=1 ttl=64 time=2.71 ms
64 bytes from 192.168.1.80: icmp_seq=2 ttl=64 time=2.53 ms
64 bytes from 192.168.1.80: icmp_seq=3 ttl=64 time=1.68 ms
64 bytes from 192.168.1.80: icmp_seq=4 ttl=64 time=1.47 ms
64 bytes from 192.168.1.80: icmp_seq=5 ttl=64 time=1.80 ms

--- 192.168.1.80 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4013ms
rtt min/avg/max/mdev = 1.468/2.037/2.709/0.491 ms
[homevork_19.1] $ /bin/bash /tmp/jenkins8548406237264441472.sh
-----NMAP install-----
[33m
0% [Working][0m
            
Hit:1 http://deb.playonlinux.com trusty InRelease
[33m
0% [Connecting to by.archive.ubuntu.com (82.209.230.71)] [Connected to download[0m[33m
0% [Waiting for headers] [Connected to download.docker.com (13.227.219.87)] [Co[0m
                                                                               
Hit:2 http://by.archive.ubuntu.com/ubuntu jammy InRelease
[33m
0% [Waiting for headers] [Waiting for headers] [Waiting for headers] [Waiting f[0m
                                                                               
Hit:3 https://download.docker.com/linux/ubuntu jammy InRelease
[33m
                                                                               
0% [Waiting for headers] [Waiting for headers] [Waiting for headers][0m
                                                                    
Hit:4 https://repo.protonvpn.com/debian stable InRelease
[33m
                                                                    
0% [Waiting for headers] [Waiting for headers][0m
                                              
Hit:5 https://apt.releases.hashicorp.com jammy InRelease
[33m
                                              
0% [Waiting for headers][0m[33m
0% [Waiting for headers][0m
                        
Hit:6 http://by.archive.ubuntu.com/ubuntu jammy-updates InRelease
[33m
                        
0% [Working][0m[33m
0% [Working][0m[33m
0% [Working][0m[33m
0% [Working][0m[33m
20% [Working][0m
             

Reading package lists... 0%

Reading package lists... 0%

Reading package lists... 0%

Reading package lists... 5%

Reading package lists... 5%

Reading package lists... 8%

Reading package lists... 8%

Reading package lists... 9%

Reading package lists... 9%

Reading package lists... 9%

Reading package lists... 9%

Reading package lists... 63%

Reading package lists... 63%

Reading package lists... 88%

Reading package lists... 88%

Reading package lists... 91%

Reading package lists... 91%

Reading package lists... 93%

Reading package lists... 93%

Reading package lists... 95%

Reading package lists... 95%

Reading package lists... 95%

Reading package lists... 95%

Reading package lists... 97%

Reading package lists... 97%

Reading package lists... 98%

Reading package lists... 98%

Reading package lists... 98%

Reading package lists... 98%

Reading package lists... 99%

Reading package lists... 99%

Reading package lists... 99%

Reading package lists... 99%

Reading package lists... 99%

Reading package lists... 99%

Reading package lists... 99%

Reading package lists... Done


Building dependency tree... 0%

Building dependency tree... 0%

Building dependency tree... 0%

Building dependency tree... 50%

Building dependency tree... 50%

Building dependency tree... Done


Reading state information... 0% 

Reading state information... 0%

Reading state information... Done

8 packages can be upgraded. Run 'apt list --upgradable' to see them.

Reading package lists... 0%

Reading package lists... 100%

Reading package lists... Done


Building dependency tree... 0%

Building dependency tree... 0%

Building dependency tree... 50%

Building dependency tree... 50%

Building dependency tree... Done


Reading state information... 0% 

Reading state information... 0%

Reading state information... Done

Suggested packages:
  ncat ndiff zenmap
The following NEW packages will be installed:
  nmap
0 upgraded, 1 newly installed, 0 to remove and 8 not upgraded.
Need to get 1,731 kB of archives.
After this operation, 4,341 kB of additional disk space will be used.
[33m
0% [Working][0m
            
Get:1 http://by.archive.ubuntu.com/ubuntu jammy/universe amd64 nmap amd64 7.91+dfsg1+really7.80+dfsg1-2build1 [1,731 kB]
[33m
0% [1 nmap 0 B/1,731 kB 0%][0m[33m
33% [1 nmap 704 kB/1,731 kB 41%][0m[33m
                                
100% [Working][0m
              
Fetched 1,731 kB in 1s (1,462 kB/s)
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
Selecting previously unselected package nmap.
(Reading database ... 
(Reading database ... 5%
(Reading database ... 10%
(Reading database ... 15%
(Reading database ... 20%
(Reading database ... 25%
(Reading database ... 30%
(Reading database ... 35%
(Reading database ... 40%
(Reading database ... 45%
(Reading database ... 50%
(Reading database ... 55%
(Reading database ... 60%
(Reading database ... 65%
(Reading database ... 70%
(Reading database ... 75%
(Reading database ... 80%
(Reading database ... 85%
(Reading database ... 90%
(Reading database ... 95%
(Reading database ... 100%
(Reading database ... 205004 files and directories currently installed.)
Preparing to unpack .../nmap_7.91+dfsg1+really7.80+dfsg1-2build1_amd64.deb ...
Unpacking nmap (7.91+dfsg1+really7.80+dfsg1-2build1) ...
Setting up nmap (7.91+dfsg1+really7.80+dfsg1-2build1) ...
Processing triggers for man-db (2.10.2-1) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
Scanning processes... [                                                        ]
Scanning processes... [                                                        ]
Scanning processes... [                                                        ]
Scanning processes... [=                                                       ]
Scanning processes... [=                                                       ]
Scanning processes... [=                                                       ]
Scanning processes... [==                                                      ]
Scanning processes... [==                                                      ]
Scanning processes... [==                                                      ]
Scanning processes... [===                                                     ]
Scanning processes... [===                                                     ]
Scanning processes... [===                                                     ]
Scanning processes... [====                                                    ]
Scanning processes... [====                                                    ]
Scanning processes... [====                                                    ]
Scanning processes... [=====                                                   ]
Scanning processes... [=====                                                   ]
Scanning processes... [======                                                  ]
Scanning processes... [======                                                  ]
Scanning processes... [======                                                  ]
Scanning processes... [=======                                                 ]
Scanning processes... [=======                                                 ]
Scanning processes... [=======                                                 ]
Scanning processes... [========                                                ]
Scanning processes... [========                                                ]
Scanning processes... [========                                                ]
Scanning processes... [=========                                               ]
Scanning processes... [=========                                               ]
Scanning processes... [=========                                               ]
Scanning processes... [==========                                              ]
Scanning processes... [==========                                              ]
Scanning processes... [===========                                             ]
Scanning processes... [===========                                             ]
Scanning processes... [===========                                             ]
Scanning processes... [============                                            ]
Scanning processes... [============                                            ]
Scanning processes... [============                                            ]
Scanning processes... [=============                                           ]
Scanning processes... [=============                                           ]
Scanning processes... [=============                                           ]
Scanning processes... [==============                                          ]
Scanning processes... [==============                                          ]
Scanning processes... [==============                                          ]
Scanning processes... [===============                                         ]
Scanning processes... [===============                                         ]
Scanning processes... [================                                        ]
Scanning processes... [================                                        ]
Scanning processes... [================                                        ]
Scanning processes... [=================                                       ]
Scanning processes... [=================                                       ]
Scanning processes... [=================                                       ]
Scanning processes... [==================                                      ]
Scanning processes... [==================                                      ]
Scanning processes... [==================                                      ]
Scanning processes... [===================                                     ]
Scanning processes... [===================                                     ]
Scanning processes... [===================                                     ]
Scanning processes... [====================                                    ]
Scanning processes... [====================                                    ]
Scanning processes... [=====================                                   ]
Scanning processes... [=====================                                   ]
Scanning processes... [=====================                                   ]
Scanning processes... [======================                                  ]
Scanning processes... [======================                                  ]
Scanning processes... [======================                                  ]
Scanning processes... [=======================                                 ]
Scanning processes... [=======================                                 ]
Scanning processes... [=======================                                 ]
Scanning processes... [========================                                ]
Scanning processes... [========================                                ]
Scanning processes... [========================                                ]
Scanning processes... [=========================                               ]
Scanning processes... [=========================                               ]
Scanning processes... [==========================                              ]
Scanning processes... [==========================                              ]
Scanning processes... [==========================                              ]
Scanning processes... [===========================                             ]
Scanning processes... [===========================                             ]
Scanning processes... [===========================                             ]
Scanning processes... [============================                            ]
Scanning processes... [============================                            ]
Scanning processes... [============================                            ]
Scanning processes... [=============================                           ]
Scanning processes... [=============================                           ]
Scanning processes... [=============================                           ]
Scanning processes... [==============================                          ]
Scanning processes... [==============================                          ]
Scanning processes... [===============================                         ]
Scanning processes... [===============================                         ]
Scanning processes... [===============================                         ]
Scanning processes... [================================                        ]
Scanning processes... [================================                        ]
Scanning processes... [================================                        ]
Scanning processes... [=================================                       ]
Scanning processes... [=================================                       ]
Scanning processes... [=================================                       ]
Scanning processes... [==================================                      ]
Scanning processes... [==================================                      ]
Scanning processes... [==================================                      ]
Scanning processes... [===================================                     ]
Scanning processes... [===================================                     ]
Scanning processes... [====================================                    ]
Scanning processes... [====================================                    ]
Scanning processes... [====================================                    ]
Scanning processes... [=====================================                   ]
Scanning processes... [=====================================                   ]
Scanning processes... [=====================================                   ]
Scanning processes... [======================================                  ]
Scanning processes... [======================================                  ]
Scanning processes... [======================================                  ]
Scanning processes... [=======================================                 ]
Scanning processes... [=======================================                 ]
Scanning processes... [=======================================                 ]
Scanning processes... [========================================                ]
Scanning processes... [========================================                ]
Scanning processes... [=========================================               ]
Scanning processes... [=========================================               ]
Scanning processes... [=========================================               ]
Scanning processes... [==========================================              ]
Scanning processes... [==========================================              ]
Scanning processes... [==========================================              ]
Scanning processes... [===========================================             ]
Scanning processes... [===========================================             ]
Scanning processes... [===========================================             ]
Scanning processes... [============================================            ]
Scanning processes... [============================================            ]
Scanning processes... [============================================            ]
Scanning processes... [=============================================           ]
Scanning processes... [=============================================           ]
Scanning processes... [==============================================          ]
Scanning processes... [==============================================          ]
Scanning processes... [==============================================          ]
Scanning processes... [===============================================         ]
Scanning processes... [===============================================         ]
Scanning processes... [===============================================         ]
Scanning processes... [================================================        ]
Scanning processes... [================================================        ]
Scanning processes... [================================================        ]
Scanning processes... [=================================================       ]
Scanning processes... [=================================================       ]
Scanning processes... [=================================================       ]
Scanning processes... [==================================================      ]
Scanning processes... [==================================================      ]
Scanning processes... [===================================================     ]
Scanning processes... [===================================================     ]
Scanning processes... [===================================================     ]
Scanning processes... [====================================================    ]
Scanning processes... [====================================================    ]
Scanning processes... [====================================================    ]
Scanning processes... [=====================================================   ]
Scanning processes... [=====================================================   ]
Scanning processes... [=====================================================   ]
Scanning processes... [======================================================  ]
Scanning processes... [======================================================  ]
Scanning processes... [======================================================  ]
Scanning processes... [======================================================= ]
Scanning processes... [======================================================= ]
Scanning processes... [========================================================]
Scanning processes...                                                           
Scanning linux images... [                                                     ]
Scanning linux images... [=============                                        ]
Scanning linux images... [==========================                           ]
Scanning linux images... [=======================================              ]
Scanning linux images... [=====================================================]
Scanning linux images...                                                        

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
Connection to 192.168.1.80 closed.
[homevork_19.1] $ /bin/bash /tmp/jenkins16754166926759341672.sh
------scan-----
Starting Nmap 7.80 ( https://nmap.org ) at 2022-09-28 22:33 +03
Nmap scan report for _gateway (192.168.1.1)
Host is up (0.00033s latency).
MAC Address: 50:FF:20:1E:40:CA (Keenetic Limited)
Nmap scan report for 277429c212042e433e262687.keenetic.io (192.168.1.2)
Host is up (0.00048s latency).
MAC Address: 50:FF:20:38:C3:A3 (Keenetic Limited)
Nmap scan report for 192.168.1.30
Host is up (0.00038s latency).
MAC Address: DC:A6:32:74:3F:A4 (Raspberry Pi Trading)
Nmap scan report for 192.168.1.44
Host is up (0.096s latency).
MAC Address: 28:C2:1F:DC:2F:E3 (Samsung Electro-mechanics(thailand))
Nmap scan report for 192.168.1.53
Host is up (0.056s latency).
MAC Address: 54:48:E6:83:D6:5B (Beijing Xiaomi Mobile Software)
Nmap scan report for 192.168.1.65
Host is up (0.15s latency).
MAC Address: 54:EF:44:23:4A:28 (Lumi United Technology)
Nmap scan report for 192.168.1.68
Host is up (0.10s latency).
MAC Address: B0:4A:39:16:C3:23 (Beijing Roborock Technology)
Nmap scan report for 192.168.1.69
Host is up (0.069s latency).
MAC Address: B8:87:6E:07:7C:2C (Unknown)
Nmap scan report for 192.168.1.71
Host is up (0.00024s latency).
MAC Address: 0A:C8:FF:15:5C:BE (Unknown)
Nmap scan report for 192.168.1.74
Host is up (0.050s latency).
MAC Address: 54:EF:44:CE:BC:29 (Lumi United Technology)
Nmap scan report for 192.168.1.82
Host is up (0.00094s latency).
MAC Address: 3C:A3:08:62:6E:04 (Texas Instruments)
Nmap scan report for 192.168.1.84
Host is up (0.00081s latency).
MAC Address: 94:E3:6D:E0:0A:BF (Texas Instruments)
Nmap scan report for 192.168.1.85
Host is up (0.10s latency).
MAC Address: 78:11:DC:58:FA:F4 (Xiaomi Electronics,co.)
Nmap scan report for 192.168.1.86
Host is up (0.100s latency).
MAC Address: 54:EF:44:34:FA:D1 (Lumi United Technology)
Nmap scan report for 192.168.1.87
Host is up (0.00092s latency).
MAC Address: 34:15:13:0D:A2:0E (Texas Instruments)
Nmap scan report for 192.168.1.92
Host is up (0.14s latency).
MAC Address: F8:B9:5A:9D:37:F3 (LG Innotek)
Nmap scan report for 192.168.1.100
Host is up (0.00013s latency).
MAC Address: 94:DE:80:09:19:6A (Giga-byte Technology)
Nmap scan report for 192.168.1.103
Host is up (0.0084s latency).
MAC Address: 92:8A:3A:92:17:F6 (Unknown)
Nmap scan report for 192.168.1.104
Host is up (0.12s latency).
MAC Address: DC:03:98:54:E9:E6 (Unknown)
Nmap scan report for 192.168.1.107
Host is up (0.14s latency).
MAC Address: 54:EF:44:26:79:D2 (Lumi United Technology)
Nmap scan report for 192.168.1.130
Host is up (0.0014s latency).
MAC Address: 08:00:27:1A:9F:FE (Oracle VirtualBox virtual NIC)
Nmap scan report for 192.168.1.143
Host is up (0.0011s latency).
MAC Address: 00:E0:4C:63:F8:76 (Realtek Semiconductor)
Nmap scan report for 192.168.1.200
Host is up (0.00097s latency).
MAC Address: 34:0A:33:BA:75:8F (D-Link International)
Nmap scan report for 192.168.1.201
Host is up (0.010s latency).
MAC Address: A8:63:7D:47:1A:60 (Unknown)
Nmap scan report for ubunru22 (192.168.1.80)
Host is up.
Nmap done: 256 IP addresses (25 hosts up) scanned in 4.04 seconds
Connection to 192.168.1.80 closed.
[homevork_19.1] $ /bin/bash /tmp/jenkins8673123600473224135.sh
------Remove nmap------

Reading package lists... 0%

Reading package lists... 100%

Reading package lists... Done


Building dependency tree... 0%

Building dependency tree... 0%

Building dependency tree... 50%

Building dependency tree... 50%

Building dependency tree... Done


Reading state information... 0% 

Reading state information... 0%

Reading state information... Done

The following packages were automatically installed and are no longer required:
  libblas3 liblinear4 lua-lpeg nmap-common
Use 'apt autoremove' to remove them.
The following packages will be REMOVED:
  nmap
0 upgraded, 0 newly installed, 1 to remove and 8 not upgraded.
After this operation, 4,341 kB disk space will be freed.
(Reading database ... 
(Reading database ... 5%
(Reading database ... 10%
(Reading database ... 15%
(Reading database ... 20%
(Reading database ... 25%
(Reading database ... 30%
(Reading database ... 35%
(Reading database ... 40%
(Reading database ... 45%
(Reading database ... 50%
(Reading database ... 55%
(Reading database ... 60%
(Reading database ... 65%
(Reading database ... 70%
(Reading database ... 75%
(Reading database ... 80%
(Reading database ... 85%
(Reading database ... 90%
(Reading database ... 95%
(Reading database ... 100%
(Reading database ... 205031 files and directories currently installed.)
Removing nmap (7.91+dfsg1+really7.80+dfsg1-2build1) ...
Processing triggers for man-db (2.10.2-1) ...
# Nmap 7.80 scan initiated Wed Sep 28 22:33:01 2022 as: nmap -sP -oN log.log 192.168.1.*
Nmap scan report for _gateway (192.168.1.1)
Host is up (0.00033s latency).
MAC Address: 50:FF:20:1E:40:CA (Keenetic Limited)
Nmap scan report for 277429c212042e433e262687.keenetic.io (192.168.1.2)
Host is up (0.00048s latency).
MAC Address: 50:FF:20:38:C3:A3 (Keenetic Limited)
Nmap scan report for 192.168.1.30
Host is up (0.00038s latency).
MAC Address: DC:A6:32:74:3F:A4 (Raspberry Pi Trading)
Nmap scan report for 192.168.1.44
Host is up (0.096s latency).
MAC Address: 28:C2:1F:DC:2F:E3 (Samsung Electro-mechanics(thailand))
Nmap scan report for 192.168.1.53
Host is up (0.056s latency).
MAC Address: 54:48:E6:83:D6:5B (Beijing Xiaomi Mobile Software)
Nmap scan report for 192.168.1.65
Host is up (0.15s latency).
MAC Address: 54:EF:44:23:4A:28 (Lumi United Technology)
Nmap scan report for 192.168.1.68
Host is up (0.10s latency).
MAC Address: B0:4A:39:16:C3:23 (Beijing Roborock Technology)
Nmap scan report for 192.168.1.69
Host is up (0.069s latency).
MAC Address: B8:87:6E:07:7C:2C (Unknown)
Nmap scan report for 192.168.1.71
Host is up (0.00024s latency).
MAC Address: 0A:C8:FF:15:5C:BE (Unknown)
Nmap scan report for 192.168.1.74
Host is up (0.050s latency).
MAC Address: 54:EF:44:CE:BC:29 (Lumi United Technology)
Nmap scan report for 192.168.1.82
Host is up (0.00094s latency).
MAC Address: 3C:A3:08:62:6E:04 (Texas Instruments)
Nmap scan report for 192.168.1.84
Host is up (0.00081s latency).
MAC Address: 94:E3:6D:E0:0A:BF (Texas Instruments)
Nmap scan report for 192.168.1.85
Host is up (0.10s latency).
MAC Address: 78:11:DC:58:FA:F4 (Xiaomi Electronics,co.)
Nmap scan report for 192.168.1.86
Host is up (0.100s latency).
MAC Address: 54:EF:44:34:FA:D1 (Lumi United Technology)
Nmap scan report for 192.168.1.87
Host is up (0.00092s latency).
MAC Address: 34:15:13:0D:A2:0E (Texas Instruments)
Nmap scan report for 192.168.1.92
Host is up (0.14s latency).
MAC Address: F8:B9:5A:9D:37:F3 (LG Innotek)
Nmap scan report for 192.168.1.100
Host is up (0.00013s latency).
MAC Address: 94:DE:80:09:19:6A (Giga-byte Technology)
Nmap scan report for 192.168.1.103
Host is up (0.0084s latency).
MAC Address: 92:8A:3A:92:17:F6 (Unknown)
Nmap scan report for 192.168.1.104
Host is up (0.12s latency).
MAC Address: DC:03:98:54:E9:E6 (Unknown)
Nmap scan report for 192.168.1.107
Host is up (0.14s latency).
MAC Address: 54:EF:44:26:79:D2 (Lumi United Technology)
Nmap scan report for 192.168.1.130
Host is up (0.0014s latency).
MAC Address: 08:00:27:1A:9F:FE (Oracle VirtualBox virtual NIC)
Nmap scan report for 192.168.1.143
Host is up (0.0011s latency).
MAC Address: 00:E0:4C:63:F8:76 (Realtek Semiconductor)
Nmap scan report for 192.168.1.200
Host is up (0.00097s latency).
MAC Address: 34:0A:33:BA:75:8F (D-Link International)
Nmap scan report for 192.168.1.201
Host is up (0.010s latency).
MAC Address: A8:63:7D:47:1A:60 (Unknown)
Nmap scan report for ubunru22 (192.168.1.80)
Host is up.
# Nmap done at Wed Sep 28 22:33:05 2022 -- 256 IP addresses (25 hosts up) scanned in 4.04 seconds
Connection to 192.168.1.80 closed.
[homevork_19.1] $ /bin/bash /tmp/jenkins4588939081976583687.sh
Finished: SUCCESS
```
