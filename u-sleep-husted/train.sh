#!/bin/bash

#SBATCH --job-name=u_time_training
#SBATCH --ntasks=1 --cpus-per-task=4 --mem=16000M
#SBATCH -p gpu --gres=gpu:titanx:1
#SBATCH --time=48:00:00

#your script, in this case: write the hostname and the ids of the chosen gpus.
hostname
echo $CUDA_VISIBLE_DEVICES
echo $CONDA_DEFAULT_ENV
echo $CONDA_PREFIX
nvidia-smi
echo $PATH
echo $LD_LIBRARY_PATH
echo $PYTHONPATH

# Run the Python script
pip install ../../psg-utils_bachalor 
pip install ../../U-Time_bachalor/ 

ut train --num_gpus 1 --preprocessed --max_loaded_per_dataset 40 --num_access_before_reload 32 --train_queue_type limitation --val_queue_type lazy --max_train_samples_per_epoch 1000000 --continue_training 