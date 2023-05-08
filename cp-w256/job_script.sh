#!/bin/bash
#SBATCH --job-name=iscqe
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=72
#SBATCH --cpus-per-task=1
#SBATCH --mem=20g
#SBATCH --time=01:00:00
#SBATCH --output=%j.out

source $HOME/.bashrc

module load intel/2021.7.0
module load mkl/2022.2.1 m4/1.4.19
module load git/2.38.1
module load intelmpi/2021.7.1

export BIN_PATH=$HOME/QE
export TESTCASE_PATH=$HOME/QE/ISC23-qe

cd $HOME/QE/ISC23-qe/CP-W256

mpirun $BIN_PATH/bin/cp.x -inp cp.in -nb 2
