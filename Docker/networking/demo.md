# NetWorking Scenarios
## demo 1 - Create Network and test
**Create 2 networks, net1 and net2**
```bash
docker network create net1
docker network create net2
```
Create 2 containers in network net1
```bash
docker run -itd --name c1 --network net1 busybox
docker run -itd --name c2 --network net1 busybox
```
**Attach to c1 and ping c2**
```bash
docker attach c1
ping c2
```
The communication between the containers work

**Create 1 containers in network net2**
```bash
docker run -itd --name c3 --network net2  busybox
```
**Attach to c3 and ping c1
```bash
docker attach c3
ping c1
```
No data received
**Lets add C2 in net2 network also**
```bash
docker network connect net2 c2
```
Now c3 can communicate with c2 but not with C1
**Disconnect a network form a running container**
```bash
docker network disconnect net2 c2
```
## demo 2 - 
