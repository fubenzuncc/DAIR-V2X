WORKSPACE=/workspace/mnt/storage/guangcongzheng/zju_zgc/DAIR-V2X
cd ${WORKSPACE}

# 永久换源，一会再恢复
# 清华
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
# 阿里源
#pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/

#
#conda install python=3.8
#conda install pytorch==1.10.1 torchvision==0.11.2 torchaudio==0.10.1 cudatoolkit=11.3 -c pytorch
#conda install openmpi==4.0.4

pip install Pillow==8.4.0
#pip install tqdm
pip install torchpack
pip install mmcv==1.4.0 mmcv-full==1.4.0 mmdet==2.20.0
pip install nuscenes-devkit
#pip install mpi4py==3.0.3
pip install numba==0.48.0

#conda install -c conda-forge mpi4py openmpi
conda install -c conda-forge mpi4py==3.0.3 openmpi==4.0.4

# pypcd
pip install pypcd3


# 注释

# 换回默认源
pip config unset global.index-url

