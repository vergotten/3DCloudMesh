#!/usr/bin/env sh

# Set the home directory
HOME=`pwd`

# Install Chamfer Distance
cd $HOME/extensions/chamfer_dist
python setup.py install --user

# Install EMD
cd $HOME/extensions/emd
python setup.py install --user

# Run the Chamfer Distance install script
bash $HOME/extensions/chamfer_dist/install.sh

# Install PointNet++
pip install "git+https://github.com/erikwijmans/Pointnet2_PyTorch.git#egg=pointnet2_ops&subdirectory=pointnet2_ops_lib"

# Install GPU kNN
pip install --upgrade https://github.com/unlimblue/KNN_CUDA/releases/download/0.2/KNN_CUDA-0.2-py3-none-any.whl
