#!/bin/bash
#SBATCH -p mcml-dgx-a100-40x8
#SBATCH -q mcml
#SBATCH --gres=gpu:1
#SBATCH --output=sft-15.txt
#SBATCH --cpus-per-task=16
#SBATCH --time=2-00:00:00


# model list: Qwen2.5-1.5B-Instruct, Qwen2.5-Math-7B,
# ---cpus-per-task=8
# -p lrz-hgx-h100-94x4, lrz-hgx-a100-80x4, lrz-dgx-a100-80x8
# -p mcml-hgx-h100-94x4, mcml-hgx-a100-80x4, mcml-dgx-a100-40x8
# -q mcml # -q mcml
cd /dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/grpo/sober-reasoning

source ~/.bashrc
conda activate verl

#local_dir1="/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/safety/verl/checkpoints/r1-verl-grpo/r1-training_grpo-qwen3B/global_step_300"
#local_dir2="/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/safety/verl/checkpoints/r1-verl-grpo/r1-training_grpo-qwen3B_prompt2"
#local_dir3="/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/safety/verl/checkpoints/r1-verl-grpo/r1-training_grpo-qwen3B_prompt3"
# grpo 100
#local_dir1="/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/safety/verl/checkpoints/r1-verl-grpo/r1-training_grpo-qwen3B/global_step_100"

# sft 5
#local_dir1="ebony59/Qwen2.5-3B-MATH-lighteval-gen-SFT"

# sft 8
#local_dir1="ebony59/Qwen2.5-3B-MATH-lighteval-gen-SFT-8epoch"

# roleplay
#local_dir1="/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/safety/verl/checkpoints/r1-verl-grpo/r1training_grpo_qwen3B_prompt_roleplay/global_step_50"

# structured
#local_dir1="/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/safety/verl/checkpoints/r1-verl-grpo/r1training_grpo_qwen3B_prompt_structured"


# tasks "custom|aime24|0|0" "custom|amc23|0|0" "custom|math_500|0|0"
# prompts "verl" "default" "shorten" "sober"
for TASK in "custom|math_500|0|0"; do
for SEED in "0" "1" "2"; do
for prompt in "sober"; do


# base
#    python main.py \
#        --model Qwen/Qwen2.5-3B \
#        --task ${TASK} \
#        --temperature 0.8 \
#        --top_p 0.9 \
#        --seed ${SEED} \
#        --output_dir "/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/grpo/sober-reasoning/results_${prompt}" \
#        --max_new_tokens 32768 \
#        --max_model_length 32768 \
#        --custom_tasks_directory lighteval_tasks.py \
#        --use_chat_template \
#        --prompt_type ${prompt}

# sft
#    python main.py \
#        --model "/dss/dssfs05/pn39qo/pn39qo-dss-0001/ebony/data/Qwen2.5-3B-math-sft/checkpoint-153" \
#        --task ${TASK} \
#        --temperature 0.8 \
#        --top_p 0.9 \
#        --seed ${SEED} \
#        --output_dir "/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/grpo/sober-reasoning/results_${prompt}" \
#        --max_new_tokens 32768 \
#        --max_model_length 32768 \
#        --custom_tasks_directory lighteval_tasks.py \
#        --use_chat_template \
#        --prompt_type ${prompt}

#python main.py \
#        --model "/dss/dssfs05/pn39qo/pn39qo-dss-0001/ebony/data/Qwen2.5-3B-math-sft/checkpoint-306" \
#        --task ${TASK} \
#        --temperature 0.8 \
#        --top_p 0.9 \
#        --seed ${SEED} \
#        --output_dir "/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/grpo/sober-reasoning/results_${prompt}" \
#        --max_new_tokens 32768 \
#        --max_model_length 32768 \
#        --custom_tasks_directory lighteval_tasks.py \
#        --use_chat_template \
#        --prompt_type ${prompt}

#python main.py \
#        --model "/dss/dssfs05/pn39qo/pn39qo-dss-0001/ebony/data/Qwen2.5-3B-math-sft/checkpoint-459" \
#        --task ${TASK} \
#        --temperature 0.8 \
#        --top_p 0.9 \
#        --seed ${SEED} \
#        --output_dir "/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/grpo/sober-reasoning/results_${prompt}" \
#        --max_new_tokens 32768 \
#        --max_model_length 32768 \
#        --custom_tasks_directory lighteval_tasks.py \
#        --use_chat_template \
#        --prompt_type ${prompt}
#

# sft-12
#python main.py \
#        --model "/dss/dssfs05/pn39qo/pn39qo-dss-0001/ebony/data/Qwen2.5-3B-math-sft/checkpoint-612" \
#        --task ${TASK} \
#        --temperature 0.8 \
#        --top_p 0.9 \
#        --seed ${SEED} \
#        --output_dir "/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/grpo/sober-reasoning/results_${prompt}" \
#        --max_new_tokens 32768 \
#        --max_model_length 32768 \
#        --custom_tasks_directory lighteval_tasks.py \
#        --use_chat_template \
#        --prompt_type ${prompt}
#

# sft 15 
python main.py \
        --model "/dss/dssfs05/pn39qo/pn39qo-dss-0001/ebony/data/Qwen2.5-3B-math-sft/checkpoint-765" \
        --task ${TASK} \
        --temperature 0.8 \
        --top_p 0.9 \
        --seed ${SEED} \
        --output_dir "/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/grpo/sober-reasoning/results_${prompt}" \
        --max_new_tokens 32768 \
        --max_model_length 32768 \
        --custom_tasks_directory lighteval_tasks.py \
        --use_chat_template \
        --prompt_type ${prompt}


## prompt1
#    python main.py \
#        --model "$local_dir1" \
#        --task ${TASK} \
#        --temperature 0.8 \
#        --top_p 0.9 \
#        --seed ${SEED} \
#        --output_dir "/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/grpo/sober-reasoning/results_${prompt}" \
#        --max_new_tokens 32768 \
#        --max_model_length 32768 \
#        --custom_tasks_directory lighteval_tasks.py \
#        --use_chat_template \
#        --prompt_type ${prompt}
### prompt2
#    python main.py \
#        --model "$local_dir2" \
#        --task ${TASK} \
#        --temperature 0.8 \
#        --top_p 0.9 \
#        --seed ${SEED} \
#        --output_dir "/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/grpo/sober-reasoning/results_${prompt}" \
#        --max_new_tokens 32768 \
#        --max_model_length 32768 \
#        --custom_tasks_directory lighteval_tasks.py \
#        --use_chat_template \
#        --prompt_type ${prompt}
## prompt3
#    python main.py \
#        --model "$local_dir3" \
#        --task ${TASK} \
#        --temperature 0.8 \
#        --top_p 0.9 \
#        --seed ${SEED} \
#        --output_dir "/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/grpo/sober-reasoning/results_${prompt}" \
#        --max_new_tokens 32768 \
#        --max_model_length 32768 \
#        --custom_tasks_directory lighteval_tasks.py \
#        --use_chat_template \
#        --prompt_type ${prompt}
done
done
done

