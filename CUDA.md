# CUDA ENV
```shell
ln -snf /usr/local/cuda-12.1 /usr/local/cuda
```

# Nvidia A100 GPUs
```shell
sudo apt-cache madison nvidia-dkms-550

sudo apt-get remove nvidia-driver-550
sudo apt-get install nvidia-driver-550=550.54.15-0ubuntu1

sudo apt-get install -y datacenter-gpu-manager
sudo systemctl --now enable nvidia-dcgm
sudo systemctl status nvidia-dcgm

sudo apt-get install cuda-drivers-fabricmanager-550=550.54.15-1
sudo systemctl start nvidia-fabricmanager
sudo systemctl status nvidia-fabricmanager

sudo apt-mark hold nvidia-driver-550=550.54.15-0ubuntu1
```
