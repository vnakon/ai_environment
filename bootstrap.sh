#!/bin/bash

echo "Provisioning virtual machine..for AI..."

echo " ----------- Installing git + docker + anakonda ----------- "

sudo apt-get -y update
sudo apt-get -y upgrade

#doker
sudo apt-get install linux-image-extra-`uname -r`
sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine
sudo systemctl status docker

sudo service docker start
sudo docker run hello-world

sudo docker pull kaggle/python

echo " ----------- Installation Completed ----------- "

echo " ----------- Running docker machine ----------- "

sudo mkdir /home/py
sudo docker run  -p 8888:8888 -v /home/py:/home -d kaggle/python /bin/bash -c "jupyter notebook --notebook-dir=/home --ip='*' --port=8888 --no-browser"
#sudo docker run  -p 8888:8888 -d kaggle/python -v /home/py /bin/bash -c "mkdir py && jupyter notebook --notebook-dir=/tmp --ip='*' --port=8888 --no-browser"

#
#sudo docker run  -p 8888:8888 -it kaggle/python /bin/bash -c "jupyter notebook --notebook-dir=/home --ip='*' --port=8888 --no-browser"
#sudo docker run  -p 8888:8888 -it kaggle/python jupyter notebook --notebook-dir=/home --ip='*' --port=8888 --no-browser >> /home/logs.txt 2>&1 &

echo " ----------- finished ----------- "

#sudo docker run  -p 8888:8888 -it kaggle/python
#jupyter notebook --notebook-dir=/home --ip='*' --port=8888 --no-browser >> logs.txt 2>&1 &



#sudo docker run -w=/tmp/ -p 8888:8888 --rm -it kaggle/python jupyter notebook --no-browser --ip="\*" --notebook-dir=/tmp/

#sudo docker run -it kaggle/python /bin/bash
#sudo jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser

#sudo docker run -v /home/vagrant:/tmp/working  -w=/tmp/working -p 8888:8888 --rm -it kaggle/python jupyter notebook --no-browser --ip="\*" --notebook-dir=/tmp/working

#sudo docker pull continuumio/anaconda3
#docker run -it continuumio/anaconda3 /bin/bash
#sudo apt-get install git-core
#exit

#sudo docker run -i -t -p 8888:8888 continuumio/anaconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser" >> flowprint_2016_10_21_12.17.txt 2>&1 &


#git
#sudo apt-get install git-core

#anaconda
#cd ../
#wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda3-2.5.0-Linux-x86_64.sh
#bash Anaconda3-2.5.0-Linux-x86_64.sh

echo " ----------- Installation Completed ----------- "