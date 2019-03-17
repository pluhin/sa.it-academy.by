### 09.Jenkins.Routine
--------
##### For work there are two hosts, one master host in which jenkins is installed and the second slave, which will perform all tasks.
- ##### Check connection to the host
  - create jenkins job for ping remote host(slave)
  > Ping task:
  ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.Jenkins.Routine/images/ping_host.png)
  > Ping output:
  ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.Jenkins.Routine/images/ping2.png)
 - ##### Install/upgrade nmap
   - Create script for check nmap installed on the slave, and if not installed, install it.
   - My install script [install.sh](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.Jenkins.Routine/scripts/install.sh)
   -  my install job
   > install_package:
   ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.Jenkins.Routine/images/install1.png)
   ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.Jenkins.Routine/images/install2.png)
   - Install output:
   > Image:
   ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.Jenkins.Routine/images/install_out.png)
 - ##### Checks all online hosts
   - Create script for nmap tools [nmap.sh](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.Jenkins.Routine/scripts/nmap.sh)
   - my nmap job
   > Image:
   ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.%20Jenkins.Routine/images/scan_job.png)
   - my job output:
   > Image:
   ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.Jenkins.Routine/images/scan_all_hosts.png)
   > Print online hosts:
   ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.Jenkins.Routine/images/print_all_hosts.png)
 - ##### Remove nmap
   - my script for remove nmap [uninstall.sh](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.Jenkins.Routine/scripts/uninstall.sh)
   - my output
   > Image:
   ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.Jenkins.Routine/images/uninstall.png)
 - ##### My pipeline
 > Pipeline:
 ![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/09.Jenkins.Routine/images/pipeline.png)
