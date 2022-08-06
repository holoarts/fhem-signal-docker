# Extension for FHEM-docker installation to communicate with Signal

Files to build a docker image with Signal support via Signalbot (Integration for signal messenger) and signal-cli (https://github.com/AsamK/signal-cli). At the moment it only tested on a Rapberrypi and will work only on ARM cpus.

The original fhem/fhem-docker image is used, see the documentation at https://github.com/fhem/fhem-docker/ . 

## Usage

* clone files 
* cd into this directory
* run `docker-compose up -d`
* go to https://<your hostname>:8083
* define a new entity with  `define signal Signalbot`


## more info

See the FHEM Wiki (German) for the usage of Signalbot.
https://wiki.fhem.de/wiki/Signalbot

See FHEM Forum (German) for more details
https://forum.fhem.de/index.php/topic,118370.0.html


This extension is based on the work of https://github.com/bublath/FHEM-Signalbot.     

For source and license of the lib libsignal_jni.so see
https://github.com/signalapp/libsignal-client

