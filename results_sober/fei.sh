#!/bin/bash
#SBATCH -p mcml-hgx-a100-80x4
#SBATCH -q mcml
#SBATCH --gres=gpu:2
#SBATCH --output=qwen3b_grpo_lighteval_prompt32.txt
#SBATCH --cpus-per-task=16
#SBATCH --time=2-00:00:00


# model list: Qwen2.5-1.5B-Instruct, Qwen2.5-Math-7B,
# ---cpus-per-task=8
# -p lrz-hgx-h100-94x4, lrz-hgx-a100-80x4, lrz-dgx-a100-80x8
# -p mcml-hgx-h100-94x4, mcml-hgx-a100-80x4, mcml-dgx-a100-40x8
# -q mcml # -q mcml
cd /dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/safety/verl

source ~/.bashrc
conda activate verl