## 3D-NTN
This repo is intended for deploying a Resilient 5G Non-terrestrial 3D Network by using Free5GC as a 5G core, OpenSand as a satellite emulator, and UERANSIM as a radio access emulator. All the components are deployed in a docker-compose environment as docker containers.

### Free5GC core
* Emulate a 5G core network by building components in a distributed way with Service Based Interface (SBI) subnet 192.168.0.0/24.
* All the 5G core components can be built executing the shell file **build_core.sh** in the directory **/home/vagrant/3D-NTN/build_images/build_core.sh**. 
* For registering the user equipment into the MongoDB database, we used a container that registers UE directly into the database without using WebUI for simplicity.

### OpenSand emulator
* The OpenSand satellite emulator consists of three components, **Satellite**, **Gateway**, and **Terminal**.
* These components are built as a docker container from the directory, **/home/vagrant/3D-NTN/build_images/opensand-simulator/opensand**.

### UERANSIM 
Is used to build docker images for gNB and UE. Running a shell file **build_ran.sh** in the directory **/home/vagrant/3D-NTN/build_images/build_ran.sh** will build the gNB and UE.

### Instructions

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

<img src="./Figs/network-model.png" title="./Figs/network-model.png" width=800px></img>

### Before executing the network after building the images,
* Install GTP5G for the Free5GC UPF to enable the GPRS Tunnelling for a 5G-based network. Run the file **./installgtp5g.sh**
* Install Docker and docker-compose

### Run experiments

* As the figure above shows, two networks are linked together, namely the terrestrial and the satellite network.
  
* The **docker-composeTer.yaml** file consists of the terrestrial connection. While the **docker-composeSat.yaml** comprised both the satellite and terrestrial networks.
  
* For the experimnet, we can use the **docker-composeSat.yaml** file with few rearrangements.
  
* To run the terrestrial network, disable the satellite network components by commenting the following containers, **upfMec** (UPF attached to the satellite terminal), **gnbSat** (Satellite connected gNB), **gateway**, **satellite**, **terminal**, and **uesat**
  
* The after doing the above step, running the **docker-composeSat.yaml** file will result in the following containers to function:

<img src="./Figs/ter.png" title="./Figs/ter.png" width=800px></img>

* And for satellite-based network deployment, uncomment the above docker containers and comment the terrestrial component containers such as **ueter**, **gnbTer**, **upfTer** and execute the **docker-composeSat.yaml** file.
  
* The result of the satellite service deployment is shown in the below figure:   
  
<img src="./Figs/sat.png" title="./Figs/sat.png" width=800px></img>

