# 3D-NTN
This repo is intended for deploying a Resilient 5G Non-terrestrial 3D Network by using Free5GC as a 5G core, OpenSand as a satellite emulator, and UERANSIM as a radio access emulator. All the components are deployed in a docker-compose environment as docker containers.

## Free5GC core
* Emulate a 5G core network by building components in a distributed way with Service Based Interface (SBI) subnet 192.168.0.0/24.
* All the 5G core components can be built executing the shell file **build_core.sh** in the directory **/home/vagrant/3D-NTN/build_images/build_core.sh**. 
* For registering the user equipment into the MongoDB database, we used a container that registers UE directly into the database without using WebUI for simplicity.

## OpenSand emulator
* The OpenSand satellite emulator consists of three components, **Satellite**, **Gateway**, and **Terminal**.
* These components are built as a docker container from the directory, **/home/vagrant/3D-NTN/build_images/opensand-simulator/opensand**.

## UERANSIM 
Is used to build docker images for gNB and UE. Running a shell file **build_ran.sh** in the directory **/home/vagrant/3D-NTN/build_images/build_ran.sh** will build the gNB and UE.

## Instructions

Clone repository in an environment where docker and docker-compose are pre-installed.

Build the docker images:

```
For 5G core
cd /home/vagrant/3D-NTN/build_images
./build_core.sh
```
```
For OpenSand
cd /home/vagrant/3D-NTN/build_images/opensand-simulator/opensand
From this directory, all the components are built when running the docker-composeSat.yaml file.
```
```
For UERANSIM
cd /home/vagrant/3D-NTN/build_images
./build_ran.sh
```
The deployed network topology is shown below below:

<img src="./Figs/network-model.png" title="./Figs/network-model.png" width=200px></img>

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


