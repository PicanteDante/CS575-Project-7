#!/bin/bash
#SBATCH -J AutoCorr
#SBATCH -A cs475-575
#SBATCH -p classmpifinal
#SBATCH -N 8 # number of nodes
#SBATCH -n 3 # number of tasks
#SBATCH -o mpiproject.out
#SBATCH -e mpiproject.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=olsenco@oregonstate.edu
module load openmpi
mpic++ main.cpp -o mpiproject -lm
mpiexec --hostfile hostfile -mca btl self,tcp -np 3 ./mpiproject
