# python v2x/train_bevfusion_base.py \
#     configs/nuscenes/det/transfusion/secfpn/camera+lidar/swint_v0p075/convfuser.yaml\
#     --model.encoders.camera.backbone.init_cfg.checkpoint pretrained/swint-nuimages-pretrained.pth \
#     --load_from pretrained/lidar-only-det.pth 


INFRA_CONFIG_FILE=./configs/fbz/bevf/trainval_config_i.py

python v2x/train_bev.py \
     configs/nuscenes/det/transfusion/secfpn/camera+lidar/swint_v0p075/convfuser.yaml\
    --model.encoders.camera.backbone.init_cfg.checkpoint pretrained/swint-nuimages-pretrained.pth \
    --config ${INFRA_CONFIG_FILE} \