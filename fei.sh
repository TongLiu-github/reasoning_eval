#source ~/.bashrc
#conda activate verl

#local_dir1="/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/safety/verl/checkpoints/r1-verl-grpo/r1-training_grpo-qwen3B/global_step_300"
#local_dir2="/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/safety/verl/checkpoints/r1-verl-grpo/r1-training_grpo-qwen3B_prompt2"
#local_dir3="/dss/dssfs05/pn39qo/pn39qo-dss-0001/tong/safety/verl/checkpoints/r1-verl-grpo/r1-training_grpo-qwen3B_prompt3"

#sys_prompt="Lorem ipsum dolor sit amet, consectetuer adipiscing elit."
# tasks "custom|aime24|0|0" "custom|amc23|0|0" "custom|math_500|0|0"
for TASK in "custom|math_500|0|0"; do
for SEED in "5"; do
for prompt in "sober"; do
# base
    python main.py \
        --model Qwen/Qwen2.5-3B \
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
done
done
done

