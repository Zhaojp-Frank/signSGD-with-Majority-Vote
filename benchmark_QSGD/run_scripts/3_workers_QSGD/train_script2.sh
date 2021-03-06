#QSGD with bidirectional
cd imagenet-fast_jiawei
cd imagenet_nv
mkdir result
cd result
mkdir Signum_and_QSGD_final
cd Signum_and_QSGD_final
mkdir QSGD_bidirection_lr=1e-2
cd QSGD_bidirection_lr=1e-2
mkdir plot
mkdir result_data
cd ..
cd ..
cd ..
ulimit -n 1000000
sudo /home/ubuntu/anaconda3/envs/fastai/bin/python3 -m torch.distributed.launch \
--nproc_per_node=1 --nnodes=3 --node_rank=1 --master_addr="0.0.0.0" \
--master_port=1235 benchmark_main.py ~/ILSVRC/Data/CLS-LOC -a resnet50 -b 128 --lr 1e-2 \
--epochs 90 --save-dir ./result/Signum_and_QSGD_final/QSGD_bidirection_lr=1e-2 --world-size 3 --print-freq 50 \
--extra_epochs 0 --compress --signum --communication_method QSGD --bidirection_compress \
--dist-url tcp://ec2-34-219-90-70.us-west-2.compute.amazonaws.com:1235