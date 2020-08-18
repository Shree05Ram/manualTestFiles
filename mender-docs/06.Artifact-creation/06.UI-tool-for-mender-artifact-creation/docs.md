---
title: Artifact Creation UI Tool
taxonomy:
    category: docs
    label: reference
---
The UI tool for mender artifact creation is hosted at [artifact.aikaan.io](https://artifact.aikaan.io)
## Creating an Artifact
The UI tool has different artifact types for creating artifacts from a file, script, debian etc, using the mender
update modules. These are the file types supported by the UI tool:
* **File** - This could be any data or DB file which you can simply push & store to a group of remotely deployed IoT Edge devices. A good example of this could be updating the configuration file of installed packages.
* **Script** - To execute any script or commands on the IoT edge devices.
* **Debian Package** - For upgrading existing or deploying new Debian packages on a fleet of
remotely deployed edge devices.
* **Android Applications (APK)** - Auto-upgrading custom APKs for android based edge
devices.
* **Custom Applications** - Upgrading custom applications on Linux devices with Application
binary and a script. The script file is going to help execute the binary, taking care of both pre and
post-execution setups and cleanups.
* **Root File system Upgrade** - Upgrading complete root file system on a targetted IoT edge
device.

Here are the steps to create an artifact using the tool:

Step - 1 : Choose the Artifact Type based on the file type used.  
Step - 2 : Input the name of the output Mender Artifact.  
Step - 3 : Input the compatible device type of this Mender Artifact.  
Step - 4 : Optionally, input the path on the target device where the file will be installed.  
Step - 5 : Import the file/script used to create the artifact.  

This will create and download the artifact on your local system. From here you can upload it to the Mender Dashboard.
