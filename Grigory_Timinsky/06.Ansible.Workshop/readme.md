# Execute playbook and check first website (curl was not installed, i made it manually)

```bash
ansible-playbook -i invent.yaml nginx.yaml 
ssh root@192.168.202.21
apt install curl
curl myhost_21-nginx.loc
```
## first website
```
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        </head>
    <body>
        <h1>This is unique nginx-server, which located on host_21</h1>
        <h2>host_21 host_21 host_21</h2>
    </body>
</html>
```
# Check second website

```bash
ssh root@192.168.202.22
apt install curl
curl myhost_22-nginx.loc
```
## second website
```
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        </head>
    <body>
        <h1>This is unique nginx-server, which located on host_22</h1>
        <h2>host_22 host_22 host_22</h2>
    </body>
</html>
```
