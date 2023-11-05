# Manual deployment of 2 micro services:
## Deploy a wordpress container
```
docker run -itd --name wp -P wordpress
```
- Access it form browser using the host port.
- Ipaddress:portnumber - http://35.170.70.1:32769
## Deploy a DB container
```
docker volume create dbvol
docker run -itd --name db -P -e MYSQL_ROOT_PASSWORD=dba@123 -v dbvol:/var/lib/mysql  mysql:5.6
docker exec -it db bash
mysql -u root -pdba@123

show databases;
create database wordpress;
use wordpress;
show tables;
```
- Nothing will be there..
- Now go to wordpress on browser and configure below details

**ON BROWSER**
  
- Database : wordpress
- User: root
- Password : dba@123
- DB_HOST : ec2-ipiddress:HostPortNumberOfDB - 35.170.70.1:32771
- Table : leave it same
Click on given button

**COMPLETE STEPS**

- Enter the site details, username, password(anything) click on week password checkbox
- Click on install
- You will be on wordpress application.
