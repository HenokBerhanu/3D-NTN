# 3D-NTN
This repo is intended for deploying a Resilient 5G Non-terrestrial 3D Network by using Free5GC as a 5G core, OpenSand as a satellite emulator, and UERANSIM as a radio access emulator. All the components are deployed in a docker-compose environment as docker containers.

## Free5GC core
Emulate a 5G core network by building components in a distributed way with Service Based Interface (SBI) subnet 192.168.0.0/24.
All the 5G core components can be built using the shell file "build_core.sh" in the directory "/home/vagrant/3D-NTN/build_images/build_core.sh"

## srsRAN 
Build docker image for srsENB and srsUE in comnetsemu (srsRAN VM). Private VM IP used 192.168.56.101

## Instructions

Clone repository in the comnetsemu VM.

Build the docker images:

```
For EPC core
cd build
./buildo5gs.sh
```
```
For srsRAN
cd build
./srsbuild3.sh
```
The network topology looks like below:

<img src="./figs/topology.png" title="./figs/topology.png" width=800px></img>

## Run experiments

## open5gs VM

Run the core network topology:
```
sudo python3 core_o5gs4g.py
```
Wait for the remote controller to start

Before running the ran network, the 4g core subscriber information should be updated in the WEBUI using localhost. 
```
http://<open5gs VM IP>:3000/
```

Note: Subsriber informations in the core network should be the same as ue informations set in the ue.conf file of the srsue.

<img src="./figs/webui.png" title="./figs/webui.png" width=800px></img>


## srsRAN VM

Run the ran network topology:
```
sudo python3 ran_srsran4g.py
```
Wait for the remote controller to start

## Start the remote controller in the srsRAN VM

Starting the controller:
```
sudo controller -v ptcp:6633
```
At this stage the ran components of the srsRAN vm should ping the EPC core in the open5gs vm and vise versa. Beside, log files of both tolology can be seen and tcpdump can also be started to observe the connection. Traffic needs to be sent from the srsRAN first because the remote controller IP is similar to the private IP of srsRAN VM. SO that either the ue or enb should ping the epc core of the open5gs VM.

#### Remark
The project is initially planned to perform S1 handover having two srsENBs and one UE, which is not complete and still needs improvement.


