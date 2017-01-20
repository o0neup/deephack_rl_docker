#!/usr/bin/env bash

sudo apt-get -y update && sudo apt-get -y upgrade


# Docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo touch /etc/apt/sources.list.d/docker.list
sudo bash -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list'
sudo apt-get -y update
sudo apt-cache policy docker-engine
sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-get install -y docker-engine
sudo docker run hello-world > /dev/null  # test this


# NVIDIA Drivers
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo apt-get -y update
sudo apt-get install -y nvidia-367
sudo apt-get install -y libcuda1-367
sudo apt-get install -y nvidia-modprobe 


# NVIDIA-docker
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0-rc.3/nvidia-docker_1.0.0.rc.3-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

sudo systemctl start nvidia-docker
sudo nvidia-docker volume create

sudo nvidia-docker run --rm nvidia/cuda nvidia-smi