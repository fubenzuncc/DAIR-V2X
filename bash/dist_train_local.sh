
CONFIG=./configs/fbz/trainval_config_i_debug.py
GPUS=2
NNODES=1
NODE_RANK=0
PORT=${PORT:-29500}
MASTER_ADDR=${MASTER_ADDR:-"127.0.0.1"}

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
python -m torch.distributed.launch \
    --nnodes=$NNODES \
    --node_rank=$NODE_RANK \
    --master_addr=$MASTER_ADDR \
    --nproc_per_node=$GPUS \
    --master_port=$PORT \
    v2x/train.py \
    $CONFIG \
    --seed 0 \
    --launcher pytorch ${@:3}