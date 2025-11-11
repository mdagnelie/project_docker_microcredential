
#!/bin/bash
#SBATCH --job-name=ml-train_run 
#SBATCH --partition=doduo
#SBATCH --mem=8G
#SBATCH --time=00:05:00
#define paths variables
MODEL_DIR=$VSC_SCRATCH/models
SIF_PATH=$VSC_SCRATCH/ml-train.sif
echo "Pulling Docker image and converting to Apptainer sif..."
apptainer pull $SIF_PATH docker://mdagnelie/ml-train:v0.1
echo "Running training script inside the container..."
apptainer exec --bind $MODEL_DIR:/app/models $SIF_PATH python /app/train.py
 
echo "Training completed."
