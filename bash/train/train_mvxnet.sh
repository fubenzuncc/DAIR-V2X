WORKSPACE=/workspace/mnt/storage/guangcongzheng/zju_zgc/DAIR-V2X
cd ${WORKSPACE}

# mkdir ./data/DAIR-V2X
# DATA_ORIGIN_DIR=/workspace/mnt/storage/guangcongzheng/DAIR-V2X-C/cooperative-vehicle-infrastructure
# ln -s DATA_ORIGIN_DIR ${WORKSPACE}/data/DAIR-V2X

# python tools/dataset_converter/dair2kitti.py --source-root ./data/DAIR-V2X/cooperative-vehicle-infrastructure/infrastructure-side \
#     --target-root ./data/DAIR-V2X/cooperative-vehicle-infrastructure/infrastructure-side \
#     --split-path ./data/split_datas/cooperative-split-data.json \
#     --label-type lidar --sensor-view infrastructure --no-classmerge

# python tools/dataset_converter/dair2kitti.py --source-root ./data/DAIR-V2X/cooperative-vehicle-infrastructure/vehicle-side \
#     --target-root ./data/DAIR-V2X/cooperative-vehicle-infrastructure/vehicle-side \
#     --split-path ./data/split_datas/cooperative-split-data.json \
#     --label-type lidar --sensor-view vehicle --no-classmerge

# cd ./configs/vic3d/late-fusion-pointcloud/pointpillars

# INFRA_CONFIG_FILE=./configs/vic3d/late-fusion-pointcloud/pointpillars/trainval_config_i.py
# VEHICLE_CONFIG_FILE=./configs/vic3d/late-fusion-pointcloud/pointpillars/trainval_config_v.py

INFRA_CONFIG_FILE=./configs/fbz/mvxnet/trainval_config_i_l.py

# save_path=/workspace/mnt/storage/guangcongzheng/DAIR-V2X-C/train_model

python v2x/train.py \
  ${INFRA_CONFIG_FILE} \